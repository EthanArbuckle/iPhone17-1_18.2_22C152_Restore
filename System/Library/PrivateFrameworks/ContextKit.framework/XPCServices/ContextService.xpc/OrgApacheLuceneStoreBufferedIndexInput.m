@interface OrgApacheLuceneStoreBufferedIndexInput
+ (id)wrapWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
+ (int)bufferSizeWithOrgApacheLuceneStoreIOContext:(id)a3;
- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3;
- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (char)readByte;
- (char)readByteWithLong:(int64_t)a3;
- (id)clone;
- (id)refill;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int)flushBufferWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4;
- (int)getBufferSize;
- (int)readInt;
- (int)readIntWithLong:(int64_t)a3;
- (int)readVInt;
- (int64_t)getFilePointer;
- (int64_t)readLong;
- (int64_t)readLongWithLong:(int64_t)a3;
- (int64_t)readVLong;
- (signed)readShort;
- (signed)readShortWithLong:(int64_t)a3;
- (void)checkBufferSizeWithInt:(int)a3;
- (void)dealloc;
- (void)newBufferWithByteArray:(id)a3;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (void)seekWithLong:(int64_t)a3;
- (void)setBufferSizeWithInt:(int)a3;
@end

@implementation OrgApacheLuceneStoreBufferedIndexInput

- (char)readByte
{
  if (self->bufferPosition_ >= self->bufferLength_) {
    -[OrgApacheLuceneStoreBufferedIndexInput refill]_0((uint64_t)self);
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  int bufferPosition = self->bufferPosition_;
  self->bufferPosition_ = bufferPosition + 1;
  uint64_t size = buffer->super.size_;
  if (bufferPosition < 0 || bufferPosition >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
  }
  return *((unsigned char *)&buffer->super.size_ + bufferPosition + 4);
}

- (id)refill
{
  uint64_t v2 = *(void *)(a1 + 40) + *(int *)(a1 + 52);
  uint64_t v3 = v2 + *(int *)(a1 + 32);
  if (v3 > (uint64_t)[(id)a1 length]) {
    LODWORD(v3) = [(id)a1 length];
  }
  uint64_t v11 = (v3 - v2);
  if ((int)v11 <= 0)
  {
    CFStringRef v14 = JreStrcat("$@", v4, v5, v6, v7, v8, v9, v10, @"read past EOF: ");
    v15 = new_JavaIoEOFException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
  }
  uint64_t v12 = *(void *)(a1 + 24);
  if (!v12)
  {
    objc_msgSend((id)a1, "newBufferWithByteArray:", +[IOSByteArray arrayWithLength:](IOSByteArray, "arrayWithLength:", *(int *)(a1 + 32)));
    [(id)a1 seekInternalWithLong:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(a1 + 24);
  }
  id result = [(id)a1 readInternalWithByteArray:v12 withInt:0 withInt:v11];
  *(_DWORD *)(a1 + 48) = v11;
  *(void *)(a1 + 40) = v2;
  *(_DWORD *)(a1 + 52) = 0;
  return result;
}

- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreBufferedIndexInput)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)setBufferSizeWithInt:(int)a3
{
  if (self->bufferSize_ != a3)
  {
    LODWORD(v8) = a3;
    sub_100100D18(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
    self->bufferSize_ = v8;
    if (self->buffer_)
    {
      uint64_t v10 = +[IOSByteArray arrayWithLength:(int)v8];
      uint64_t bufferPosition = self->bufferPosition_;
      int v12 = self->bufferLength_ - bufferPosition;
      if (v12 >= (int)v8) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = v12;
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->buffer_, bufferPosition, v10, 0, v8);
      self->bufferStart_ += self->bufferPosition_;
      self->bufferPosition_ = 0;
      self->bufferLength_ = v8;
      [(OrgApacheLuceneStoreBufferedIndexInput *)self newBufferWithByteArray:v10];
    }
  }
}

- (void)newBufferWithByteArray:(id)a3
{
}

- (int)getBufferSize
{
  return self->bufferSize_;
}

- (void)checkBufferSizeWithInt:(int)a3
{
  sub_100100D18(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
}

- (signed)readShort
{
  uint64_t bufferPosition = self->bufferPosition_;
  if (self->bufferLength_ - (int)bufferPosition < 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
    return [(OrgApacheLuceneStoreDataInput *)&v10 readShort];
  }
  else
  {
    int v4 = bufferPosition + 1;
    self->bufferPosition_ = bufferPosition + 1;
    buffer = self->buffer_;
    if (!buffer) {
      JreThrowNullPointerException();
    }
    uint64_t size = buffer->super.size_;
    if ((bufferPosition & 0x80000000) != 0 || (int)bufferPosition >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
    }
    __int16 v7 = *((unsigned __int8 *)&buffer->super.size_ + bufferPosition + 4) << 8;
    self->bufferPosition_ = v4 + 1;
    uint64_t v8 = buffer->super.size_;
    if (v4 < 0 || v4 >= (int)v8) {
      IOSArray_throwOutOfBoundsWithMsg(v8, v4);
    }
    return v7 | *((unsigned __int8 *)&buffer->super.size_ + v4 + 4);
  }
}

- (int)readInt
{
  uint64_t bufferPosition = self->bufferPosition_;
  if (self->bufferLength_ - (int)bufferPosition < 4)
  {
    v14.receiver = self;
    v14.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
    return [(OrgApacheLuceneStoreDataInput *)&v14 readInt];
  }
  else
  {
    self->bufferPosition_ = bufferPosition + 3;
    buffer = self->buffer_;
    if (!buffer) {
      JreThrowNullPointerException();
    }
    int v5 = bufferPosition + 1;
    uint64_t v6 = (bufferPosition + 2);
    uint64_t size = buffer->super.size_;
    if ((bufferPosition & 0x80000000) != 0 || (int)bufferPosition >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
    }
    uint64_t v8 = self->buffer_;
    int v9 = *((unsigned __int8 *)&buffer->super.size_ + bufferPosition + 4) << 24;
    if (v5 < 0 || v5 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (bufferPosition + 1));
    }
    if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    int v10 = v9 | (*((unsigned __int8 *)&v8->super.size_ + v5 + 4) << 16) | (*((unsigned __int8 *)&v8->super.size_
                                                                          + (int)v6
                                                                          + 4) << 8);
    int v11 = self->bufferPosition_;
    self->bufferPosition_ = v11 + 1;
    uint64_t v12 = v8->super.size_;
    if (v11 < 0 || v11 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v11);
    }
    return v10 | *((unsigned __int8 *)&v8->super.size_ + v11 + 4);
  }
}

- (int64_t)readLong
{
  uint64_t bufferPosition = self->bufferPosition_;
  if (self->bufferLength_ - (int)bufferPosition < 8)
  {
    v27.receiver = self;
    v27.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
    return [(OrgApacheLuceneStoreDataInput *)&v27 readLong];
  }
  else
  {
    self->bufferPosition_ = bufferPosition + 3;
    buffer = self->buffer_;
    if (!buffer) {
      JreThrowNullPointerException();
    }
    uint64_t v5 = (bufferPosition + 1);
    uint64_t v6 = (bufferPosition + 2);
    uint64_t size = buffer->super.size_;
    if ((bufferPosition & 0x80000000) != 0 || (int)bufferPosition >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
    }
    int v8 = *((unsigned __int8 *)&buffer->super.size_ + bufferPosition + 4);
    if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v5);
    }
    int v9 = *((unsigned __int8 *)&self->buffer_->super.size_ + (int)v5 + 4);
    if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    int v10 = *((unsigned __int8 *)&buffer->super.size_ + (int)v6 + 4);
    int v11 = self->bufferPosition_;
    int v12 = v11 + 1;
    self->bufferPosition_ = v11 + 1;
    uint64_t v13 = buffer->super.size_;
    if (v11 < 0 || v11 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v11);
    }
    unsigned int v14 = *((unsigned __int8 *)&buffer->super.size_ + v11 + 4);
    int v15 = v8 << 24;
    uint64_t v16 = (v11 + 2);
    uint64_t v17 = (v11 + 3);
    self->bufferPosition_ = v11 + 4;
    v18 = self->buffer_;
    uint64_t v19 = v18->super.size_;
    if (v12 < 0 || v12 >= (int)v19) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v12);
    }
    v20 = self->buffer_;
    int v21 = v15 | (v9 << 16);
    if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v19) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v16);
    }
    int v22 = v21 | (v10 << 8);
    if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v19) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v17);
    }
    unint64_t v23 = ((unint64_t)*((unsigned __int8 *)&v18->super.size_ + v12 + 4) << 24) | ((unint64_t)*((unsigned __int8 *)&v18->super.size_ + (int)v16 + 4) << 16) | ((unint64_t)*((unsigned __int8 *)&v20->super.size_ + (int)v17 + 4) << 8);
    int v24 = self->bufferPosition_;
    self->bufferPosition_ = v24 + 1;
    uint64_t v25 = v20->super.size_;
    if (v24 < 0 || v24 >= (int)v25) {
      IOSArray_throwOutOfBoundsWithMsg(v25, v24);
    }
    return v23 | *((unsigned __int8 *)&v20->super.size_ + v24 + 4) | ((unint64_t)(v22 | v14) << 32);
  }
}

- (int)readVInt
{
  uint64_t bufferPosition = self->bufferPosition_;
  if (self->bufferLength_ - (int)bufferPosition < 5)
  {
    v24.receiver = self;
    v24.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
    return [(OrgApacheLuceneStoreDataInput *)&v24 readVInt];
  }
  else
  {
    buffer = self->buffer_;
    if (!buffer) {
      JreThrowNullPointerException();
    }
    self->bufferPosition_ = bufferPosition + 1;
    uint64_t size = buffer->super.size_;
    if ((bufferPosition & 0x80000000) != 0 || (int)bufferPosition >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
    }
    int result = *((char *)&buffer->super.size_ + bufferPosition + 4);
    if (result < 0)
    {
      int v7 = result & 0x7F;
      int v8 = self->buffer_;
      int v9 = self->bufferPosition_;
      self->bufferPosition_ = v9 + 1;
      uint64_t v10 = v8->super.size_;
      if (v9 < 0 || v9 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v9);
      }
      int v11 = *((char *)&v8->super.size_ + v9 + 4);
      int result = v7 & 0xFFFFC07F | ((v11 & 0x7F) << 7);
      if (v11 < 0)
      {
        int v12 = self->buffer_;
        int v13 = self->bufferPosition_;
        self->bufferPosition_ = v13 + 1;
        uint64_t v14 = v12->super.size_;
        if (v13 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v13);
        }
        int v15 = *((char *)&v12->super.size_ + v13 + 4);
        int result = result & 0xFFE03FFF | ((v15 & 0x7F) << 14);
        if (v15 < 0)
        {
          uint64_t v16 = self->buffer_;
          int v17 = self->bufferPosition_;
          self->bufferPosition_ = v17 + 1;
          uint64_t v18 = v16->super.size_;
          if (v17 < 0 || v17 >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v17);
          }
          int v19 = *((char *)&v16->super.size_ + v17 + 4);
          int result = result & 0xF01FFFFF | ((v19 & 0x7F) << 21);
          if (v19 < 0)
          {
            v20 = self->buffer_;
            int v21 = self->bufferPosition_;
            self->bufferPosition_ = v21 + 1;
            if (v21 < 0 || v21 >= v20->super.size_) {
              IOSArray_throwOutOfBoundsWithMsg(v20->super.size_, v21);
            }
            unsigned int v22 = *((unsigned __int8 *)&v20->super.size_ + v21 + 4);
            if (v22 > 0xF)
            {
              unint64_t v23 = new_JavaIoIOException_initWithNSString_(@"Invalid vInt detected (too many bits)");
              objc_exception_throw(v23);
            }
            return result | (v22 << 28);
          }
        }
      }
    }
  }
  return result;
}

- (int64_t)readVLong
{
  uint64_t bufferPosition = self->bufferPosition_;
  if (self->bufferLength_ - (int)bufferPosition < 9)
  {
    v40.receiver = self;
    v40.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
    return [(OrgApacheLuceneStoreDataInput *)&v40 readVLong];
  }
  else
  {
    buffer = self->buffer_;
    if (!buffer) {
      JreThrowNullPointerException();
    }
    self->bufferPosition_ = bufferPosition + 1;
    uint64_t size = buffer->super.size_;
    if ((bufferPosition & 0x80000000) != 0 || (int)bufferPosition >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
    }
    int64_t result = *((unsigned __int8 *)&buffer->super.size_ + bufferPosition + 4);
    if (*((char *)&buffer->super.size_ + bufferPosition + 4) < 0)
    {
      int64_t v7 = result & 0x7F;
      int v8 = self->buffer_;
      int v9 = self->bufferPosition_;
      self->bufferPosition_ = v9 + 1;
      uint64_t v10 = v8->super.size_;
      if (v9 < 0 || v9 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v9);
      }
      int v11 = *((char *)&v8->super.size_ + v9 + 4);
      int64_t result = v7 | ((unint64_t)(v11 & 0x7F) << 7);
      if (v11 < 0)
      {
        int v12 = self->buffer_;
        int v13 = self->bufferPosition_;
        self->bufferPosition_ = v13 + 1;
        uint64_t v14 = v12->super.size_;
        if (v13 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v13);
        }
        int v15 = *((char *)&v12->super.size_ + v13 + 4);
        result |= (unint64_t)(v15 & 0x7F) << 14;
        if (v15 < 0)
        {
          uint64_t v16 = self->buffer_;
          int v17 = self->bufferPosition_;
          self->bufferPosition_ = v17 + 1;
          uint64_t v18 = v16->super.size_;
          if (v17 < 0 || v17 >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v17);
          }
          int v19 = *((char *)&v16->super.size_ + v17 + 4);
          result |= (unint64_t)(v19 & 0x7F) << 21;
          if (v19 < 0)
          {
            v20 = self->buffer_;
            int v21 = self->bufferPosition_;
            self->bufferPosition_ = v21 + 1;
            uint64_t v22 = v20->super.size_;
            if (v21 < 0 || v21 >= (int)v22) {
              IOSArray_throwOutOfBoundsWithMsg(v22, v21);
            }
            int v23 = *((char *)&v20->super.size_ + v21 + 4);
            result |= (unint64_t)(v23 & 0x7F) << 28;
            if (v23 < 0)
            {
              objc_super v24 = self->buffer_;
              int v25 = self->bufferPosition_;
              self->bufferPosition_ = v25 + 1;
              uint64_t v26 = v24->super.size_;
              if (v25 < 0 || v25 >= (int)v26) {
                IOSArray_throwOutOfBoundsWithMsg(v26, v25);
              }
              int v27 = *((char *)&v24->super.size_ + v25 + 4);
              result |= (unint64_t)(v27 & 0x7F) << 35;
              if (v27 < 0)
              {
                v28 = self->buffer_;
                int v29 = self->bufferPosition_;
                self->bufferPosition_ = v29 + 1;
                uint64_t v30 = v28->super.size_;
                if (v29 < 0 || v29 >= (int)v30) {
                  IOSArray_throwOutOfBoundsWithMsg(v30, v29);
                }
                int v31 = *((char *)&v28->super.size_ + v29 + 4);
                result |= (unint64_t)(v31 & 0x7F) << 42;
                if (v31 < 0)
                {
                  v32 = self->buffer_;
                  int v33 = self->bufferPosition_;
                  self->bufferPosition_ = v33 + 1;
                  uint64_t v34 = v32->super.size_;
                  if (v33 < 0 || v33 >= (int)v34) {
                    IOSArray_throwOutOfBoundsWithMsg(v34, v33);
                  }
                  int v35 = *((char *)&v32->super.size_ + v33 + 4);
                  result |= (unint64_t)(v35 & 0x7F) << 49;
                  if (v35 < 0)
                  {
                    v36 = self->buffer_;
                    int v37 = self->bufferPosition_;
                    self->bufferPosition_ = v37 + 1;
                    if (v37 < 0 || v37 >= v36->super.size_) {
                      IOSArray_throwOutOfBoundsWithMsg(v36->super.size_, v37);
                    }
                    int v38 = *((char *)&v36->super.size_ + v37 + 4);
                    if (v38 < 0)
                    {
                      v39 = new_JavaIoIOException_initWithNSString_(@"Invalid vLong detected (negative values disallowed)");
                      objc_exception_throw(v39);
                    }
                    return result | ((unint64_t)v38 << 56);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (char)readByteWithLong:(int64_t)a3
{
  uint64_t v4 = a3 - self->bufferStart_;
  if (v4 < 0 || v4 >= self->bufferLength_)
  {
    self->bufferStart_ = a3;
    self->bufferPosition_ = 0;
    self->bufferLength_ = 0;
    -[OrgApacheLuceneStoreBufferedIndexInput seekInternalWithLong:](self, "seekInternalWithLong:");
    -[OrgApacheLuceneStoreBufferedIndexInput refill]_0((uint64_t)self);
    uint64_t v4 = 0;
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return *((unsigned char *)&buffer->super.size_ + v4 + 4);
}

- (signed)readShortWithLong:(int64_t)a3
{
  uint64_t v4 = a3 - self->bufferStart_;
  if (v4 < 0 || v4 >= self->bufferLength_ - 1)
  {
    self->bufferStart_ = a3;
    self->bufferPosition_ = 0;
    self->bufferLength_ = 0;
    -[OrgApacheLuceneStoreBufferedIndexInput seekInternalWithLong:](self, "seekInternalWithLong:");
    -[OrgApacheLuceneStoreBufferedIndexInput refill]_0((uint64_t)self);
    uint64_t v4 = 0;
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  int64_t v7 = self->buffer_;
  __int16 v8 = *((unsigned __int8 *)&buffer->super.size_ + v4 + 4);
  int v9 = v4 + 1;
  if (v4 + 1 < 0 || (int)size <= v9) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4 + 1);
  }
  return *((unsigned __int8 *)&v7->super.size_ + v9 + 4) | (unsigned __int16)(v8 << 8);
}

- (int)readIntWithLong:(int64_t)a3
{
  uint64_t v4 = a3 - self->bufferStart_;
  if (v4 < 0 || v4 >= self->bufferLength_ - 3)
  {
    self->bufferStart_ = a3;
    self->bufferPosition_ = 0;
    self->bufferLength_ = 0;
    -[OrgApacheLuceneStoreBufferedIndexInput seekInternalWithLong:](self, "seekInternalWithLong:");
    -[OrgApacheLuceneStoreBufferedIndexInput refill]_0((uint64_t)self);
    uint64_t v4 = 0;
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  int v7 = *((unsigned __int8 *)&buffer->super.size_ + v4 + 4);
  uint64_t v8 = v4 + 1;
  if (v4 + 1 < 0 || (int)size <= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  int v9 = self->buffer_;
  int v10 = *((unsigned __int8 *)&v9->super.size_ + (v4 + 1) + 4);
  uint64_t v11 = v4 << 32;
  BOOL v12 = (v4 << 32) + 0x200000000 < 0;
  uint64_t v13 = ((v4 << 32) + 0x200000000) >> 32;
  if (v12 || (int)size <= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(size, v13);
  }
  int v14 = *((unsigned __int8 *)&v9->super.size_ + v13 + 4);
  uint64_t v15 = (v11 + 0x300000000) >> 32;
  if (v11 + 0x300000000 < 0 || (int)size <= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v11 + 0x300000000) >> 32);
  }
  return (v7 << 24) | (v10 << 16) | (v14 << 8) | *((unsigned __int8 *)&v9->super.size_ + v15 + 4);
}

- (int64_t)readLongWithLong:(int64_t)a3
{
  uint64_t v4 = a3 - self->bufferStart_;
  if (v4 < 0 || v4 >= self->bufferLength_ - 7)
  {
    self->bufferStart_ = a3;
    self->bufferPosition_ = 0;
    self->bufferLength_ = 0;
    -[OrgApacheLuceneStoreBufferedIndexInput seekInternalWithLong:](self, "seekInternalWithLong:");
    -[OrgApacheLuceneStoreBufferedIndexInput refill]_0((uint64_t)self);
    uint64_t v4 = 0;
  }
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  int v7 = *((unsigned __int8 *)&buffer->super.size_ + v4 + 4);
  uint64_t v8 = v4 + 1;
  if (v4 + 1 < 0 || (int)size <= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  int v9 = *((unsigned __int8 *)&buffer->super.size_ + (v4 + 1) + 4);
  uint64_t v10 = v4 << 32;
  BOOL v11 = (v4 << 32) + 0x200000000 < 0;
  uint64_t v12 = ((v4 << 32) + 0x200000000) >> 32;
  if (v11 || (int)size <= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(size, v12);
  }
  int v13 = *((unsigned __int8 *)&buffer->super.size_ + v12 + 4);
  uint64_t v14 = (v10 + 0x300000000) >> 32;
  if (v10 + 0x300000000 < 0 || (int)size <= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v10 + 0x300000000) >> 32);
  }
  unsigned int v15 = *((unsigned __int8 *)&buffer->super.size_ + v14 + 4);
  uint64_t v16 = (v10 + 0x400000000) >> 32;
  if (v10 + 0x400000000 < 0 || (int)size <= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v10 + 0x400000000) >> 32);
  }
  uint64_t v17 = *((unsigned __int8 *)&buffer->super.size_ + v16 + 4);
  uint64_t v18 = (v10 + 0x500000000) >> 32;
  if (v10 + 0x500000000 < 0 || (int)size <= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v10 + 0x500000000) >> 32);
  }
  uint64_t v19 = *((unsigned __int8 *)&buffer->super.size_ + v18 + 4);
  uint64_t v20 = (v10 + 0x600000000) >> 32;
  if (v10 + 0x600000000 < 0 || (int)size <= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v10 + 0x600000000) >> 32);
  }
  uint64_t v21 = *((unsigned __int8 *)&buffer->super.size_ + v20 + 4);
  uint64_t v22 = (v10 + 0x700000000) >> 32;
  if (v10 + 0x700000000 < 0 || (int)size <= (int)v22) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v10 + 0x700000000) >> 32);
  }
  return (v17 << 24) | (v19 << 16) | (v21 << 8) | *((unsigned __int8 *)&buffer->super.size_ + v22 + 4) | ((unint64_t)((v7 << 24) | (v9 << 16) | (v13 << 8) | v15) << 32);
}

- (int64_t)getFilePointer
{
  return self->bufferStart_ + self->bufferPosition_;
}

- (void)seekWithLong:(int64_t)a3
{
  int64_t bufferStart = self->bufferStart_;
  if (a3 < bufferStart || bufferStart + self->bufferLength_ <= a3)
  {
    self->bufferStart_ = a3;
    self->bufferPosition_ = 0;
    self->bufferLength_ = 0;
    -[OrgApacheLuceneStoreBufferedIndexInput seekInternalWithLong:](self, "seekInternalWithLong:");
  }
  else
  {
    self->bufferPosition_ = a3 - bufferStart;
  }
}

- (id)clone
{
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
  uint64_t v3 = [(OrgApacheLuceneStoreIndexInput *)&v5 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign(v3 + 3, 0);
  *((_DWORD *)v3 + 12) = 0;
  *((_DWORD *)v3 + 13) = 0;
  v3[5] = (id)(self->bufferStart_ + self->bufferPosition_);
  return v3;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  return OrgApacheLuceneStoreBufferedIndexInput_wrapWithNSString_withOrgApacheLuceneStoreIndexInput_withLong_withLong_((uint64_t)a3, self, a4, a5);
}

- (int)flushBufferWithOrgApacheLuceneStoreIndexOutput:(id)a3 withLong:(int64_t)a4
{
  if (self->bufferLength_ - self->bufferPosition_ <= a4) {
    int v4 = self->bufferLength_ - self->bufferPosition_;
  }
  else {
    int v4 = a4;
  }
  if (v4 >= 1)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    objc_msgSend(a3, "writeBytesWithByteArray:withInt:withInt:", self->buffer_);
    self->bufferPosition_ += v4;
  }
  return v4;
}

+ (int)bufferSizeWithOrgApacheLuceneStoreIOContext:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([*((id *)a3 + 1) ordinal]) {
    return 1024;
  }
  else {
    return 4096;
  }
}

+ (id)wrapWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
  return OrgApacheLuceneStoreBufferedIndexInput_wrapWithNSString_withOrgApacheLuceneStoreIndexInput_withLong_withLong_((uint64_t)a3, a4, a5, a6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end