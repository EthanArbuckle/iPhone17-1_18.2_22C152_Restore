@interface JavaNetSocks4Message
+ (const)__metadata;
- (JavaNetSocks4Message)init;
- (id)description;
- (id)getBytes;
- (id)getErrorStringWithInt:(int)a3;
- (id)getStringWithInt:(int)a3 withInt:(int)a4;
- (id)getUserId;
- (int)getCommandOrResult;
- (int)getIP;
- (int)getLength;
- (int)getPort;
- (uint64_t)getVersionNumber;
- (void)dealloc;
- (void)setCommandOrResultWithInt:(int)a3;
- (void)setIPWithByteArray:(id)a3;
- (void)setPortWithInt:(int)a3;
- (void)setStringWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5;
- (void)setUserIdWithNSString:(id)a3;
- (void)setVersionNumberWithInt:(int)a3;
@end

@implementation JavaNetSocks4Message

- (JavaNetSocks4Message)init
{
  return self;
}

- (int)getCommandOrResult
{
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((int)size <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(size, 1);
  }
  return *((char *)&buffer->super.size_ + 5);
}

- (void)setCommandOrResultWithInt:(int)a3
{
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((int)size <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(size, 1);
  }
  *((unsigned char *)&buffer->super.size_ + 5) = a3;
}

- (int)getPort
{
  buffer = self->buffer_;
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)buffer, 2, JavaNioByteOrder_BIG_ENDIAN__);
}

- (void)setPortWithInt:(int)a3
{
  __int16 v3 = a3;
  buffer = self->buffer_;
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = JavaNioByteOrder_BIG_ENDIAN__;
  LibcoreIoMemory_pokeShortWithByteArray_withInt_withShort_withJavaNioByteOrder_((uint64_t)buffer, 2, v3, v5);
}

- (int)getIP
{
  buffer = self->buffer_;
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = JavaNioByteOrder_BIG_ENDIAN__;
  return LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)buffer, 4, v3);
}

- (void)setIPWithByteArray:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v4 = *((unsigned int *)a3 + 2);
  if ((int)v4 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v4, 0);
  }
  buffer = self->buffer_;
  if (!buffer) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t size = buffer->super.size_;
  if ((int)size <= 4) {
    IOSArray_throwOutOfBoundsWithMsg(size, 4);
  }
  buffer->buffer_[0] = *((unsigned char *)a3 + 12);
  uint64_t v7 = *((unsigned int *)a3 + 2);
  if ((int)v7 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 1);
  }
  v8 = self->buffer_;
  uint64_t v9 = v8->super.size_;
  if ((int)v9 <= 5) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 5);
  }
  v8->buffer_[1] = *((unsigned char *)a3 + 13);
  uint64_t v10 = *((unsigned int *)a3 + 2);
  if ((int)v10 <= 2) {
    IOSArray_throwOutOfBoundsWithMsg(v10, 2);
  }
  v11 = self->buffer_;
  uint64_t v12 = v11->super.size_;
  if ((int)v12 <= 6) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 6);
  }
  v11->buffer_[2] = *((unsigned char *)a3 + 14);
  uint64_t v13 = *((unsigned int *)a3 + 2);
  if ((int)v13 <= 3) {
    IOSArray_throwOutOfBoundsWithMsg(v13, 3);
  }
  v14 = self->buffer_;
  uint64_t v15 = v14->super.size_;
  if ((int)v15 <= 7) {
    IOSArray_throwOutOfBoundsWithMsg(v15, 7);
  }
  v14->buffer_[3] = *((unsigned char *)a3 + 15);
}

- (id)getUserId
{
  return sub_1002282F0((uint64_t)self, 8, 248);
}

- (void)setUserIdWithNSString:(id)a3
{
}

- (id)description
{
  uint64_t v3 = new_JavaLangStringBuilder_initWithInt_(0x32u);
  [(JavaLangStringBuilder *)v3 appendWithNSString:@"Version: "];
  unsigned int v4 = -[JavaNetSocks4Message getVersionNumber]_0((uint64_t)self);
  [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toHexStringWithInt_(v4)];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@" Command: "];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toHexStringWithInt_([(JavaNetSocks4Message *)self getCommandOrResult])];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@" Port: "];
  [(JavaLangStringBuilder *)v3 appendWithInt:[(JavaNetSocks4Message *)self getPort]];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@" IP: "];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toHexStringWithInt_([(JavaNetSocks4Message *)self getIP])];
  [(JavaLangStringBuilder *)v3 appendWithNSString:@" User ID: "];
  [(JavaLangStringBuilder *)v3 appendWithNSString:[(JavaNetSocks4Message *)self getUserId]];
  return [(JavaLangStringBuilder *)v3 description];
}

- (uint64_t)getVersionNumber
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1) {
    JreThrowNullPointerException();
  }
  uint64_t v2 = *(unsigned int *)(v1 + 8);
  if ((int)v2 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v2, 0);
  }
  return *(char *)(v1 + 12);
}

- (int)getLength
{
  buffer = self->buffer_;
  if (!buffer) {
LABEL_10:
  }
    JreThrowNullPointerException();
  int v4 = 9;
  while (1)
  {
    uint64_t size = buffer->super.size_;
    int v6 = v4 - 1;
    if (v4 - 1 < 0 || v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    if (!*((unsigned char *)&buffer->super.size_ + v4 + 3)) {
      return v4;
    }
    buffer = self->buffer_;
    ++v4;
    if (!buffer) {
      goto LABEL_10;
    }
  }
}

- (id)getErrorStringWithInt:(int)a3
{
  if ((a3 - 91) > 2) {
    return @"Success";
  }
  else {
    return (id)*((void *)&off_100451A30 + a3 - 91);
  }
}

- (id)getBytes
{
  return self->buffer_;
}

- (id)getStringWithInt:(int)a3 withInt:(int)a4
{
  return sub_1002282F0((uint64_t)self, *(uint64_t *)&a3, a4);
}

- (void)setStringWithInt:(int)a3 withInt:(int)a4 withNSString:(id)a5
{
}

- (void)setVersionNumberWithInt:(int)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetSocks4Message;
  [(JavaNetSocks4Message *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004519C0;
}

@end