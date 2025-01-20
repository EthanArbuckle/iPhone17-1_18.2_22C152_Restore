@interface OrgApacheLuceneStoreByteArrayDataInput
- (BOOL)eof;
- (OrgApacheLuceneStoreByteArrayDataInput)init;
- (OrgApacheLuceneStoreByteArrayDataInput)initWithByteArray:(id)a3;
- (OrgApacheLuceneStoreByteArrayDataInput)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (char)readByte;
- (int)getPosition;
- (int)length;
- (int)readInt;
- (int)readVInt;
- (int64_t)readLong;
- (int64_t)readVLong;
- (signed)readShort;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)resetWithByteArray:(id)a3;
- (void)resetWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)rewind;
- (void)setPositionWithInt:(int)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreByteArrayDataInput

- (OrgApacheLuceneStoreByteArrayDataInput)initWithByteArray:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreByteArrayDataInput)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  OrgApacheLuceneStoreDataInput_init(self, a2);
  [(OrgApacheLuceneStoreByteArrayDataInput *)self resetWithByteArray:a3 withInt:v6 withInt:v5];
  return self;
}

- (OrgApacheLuceneStoreByteArrayDataInput)init
{
  return self;
}

- (void)resetWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(OrgApacheLuceneStoreByteArrayDataInput *)self resetWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)rewind
{
  self->pos_ = 0;
}

- (int)getPosition
{
  return self->pos_;
}

- (void)setPositionWithInt:(int)a3
{
  self->pos_ = a3;
}

- (void)resetWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ = a4;
  self->limit_ = a5 + a4;
}

- (int)length
{
  return self->limit_;
}

- (BOOL)eof
{
  return self->pos_ == self->limit_;
}

- (void)skipBytesWithLong:(int64_t)a3
{
  self->pos_ += a3;
}

- (signed)readShort
{
  uint64_t pos = self->pos_;
  uint64_t v3 = (pos + 1);
  self->pos_ = v3;
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  uint64_t size = bytes->super.size_;
  if ((pos & 0x80000000) != 0 || (int)pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  __int16 v7 = *((unsigned __int8 *)&bytes->super.size_ + pos + 4);
  self->pos_ = v3 + 1;
  uint64_t v8 = bytes->super.size_;
  if ((v3 & 0x80000000) != 0 || (int)v3 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v3);
  }
  return *((unsigned __int8 *)&bytes->super.size_ + (int)v3 + 4) | (unsigned __int16)(v7 << 8);
}

- (int)readInt
{
  uint64_t pos = self->pos_;
  self->pos_ = pos + 3;
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = (pos + 1);
  uint64_t v6 = (pos + 2);
  uint64_t size = bytes->super.size_;
  if ((pos & 0x80000000) != 0 || (int)pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  int v8 = *((unsigned __int8 *)&bytes->super.size_ + pos + 4);
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  int v9 = *((unsigned __int8 *)&bytes->super.size_ + (int)v5 + 4);
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  int v10 = *((unsigned __int8 *)&bytes->super.size_ + (int)v6 + 4);
  int v11 = self->pos_;
  self->pos_ = v11 + 1;
  uint64_t v12 = bytes->super.size_;
  if (v11 < 0 || v11 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v11);
  }
  return (v8 << 24) | (v9 << 16) | (v10 << 8) | *((unsigned __int8 *)&bytes->super.size_ + v11 + 4);
}

- (int64_t)readLong
{
  uint64_t pos = self->pos_;
  self->pos_ = pos + 3;
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = (pos + 1);
  uint64_t v6 = (pos + 2);
  uint64_t size = bytes->super.size_;
  if ((pos & 0x80000000) != 0 || (int)pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  int v8 = *((unsigned __int8 *)&bytes->super.size_ + pos + 4);
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  int v9 = *((unsigned __int8 *)&bytes->super.size_ + (int)v5 + 4);
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  int v10 = *((unsigned __int8 *)&bytes->super.size_ + (int)v6 + 4);
  int v11 = self->pos_;
  int v12 = v11 + 1;
  self->pos_ = v11 + 1;
  uint64_t v13 = bytes->super.size_;
  if (v11 < 0 || v11 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v11);
  }
  unsigned int v14 = *((unsigned __int8 *)&bytes->super.size_ + v11 + 4);
  uint64_t v15 = (v11 + 2);
  uint64_t v16 = (v11 + 3);
  self->pos_ = v11 + 4;
  v17 = self->bytes_;
  uint64_t v18 = v17->super.size_;
  if (v12 < 0 || v12 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v12);
  }
  v19 = self->bytes_;
  uint64_t v20 = *((unsigned __int8 *)&v17->super.size_ + v12 + 4);
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v15);
  }
  uint64_t v21 = *((unsigned __int8 *)&v19->super.size_ + (int)v15 + 4);
  if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v16);
  }
  uint64_t v22 = *((unsigned __int8 *)&v17->super.size_ + (int)v16 + 4);
  int v23 = self->pos_;
  self->pos_ = v23 + 1;
  uint64_t v24 = v19->super.size_;
  if (v23 < 0 || v23 >= (int)v24) {
    IOSArray_throwOutOfBoundsWithMsg(v24, v23);
  }
  return (v20 << 24) | (v21 << 16) | (v22 << 8) | *((unsigned __int8 *)&v19->super.size_ + v23 + 4) | ((unint64_t)((v8 << 24) | (v9 << 16) | (v10 << 8) | v14) << 32);
}

- (int)readVInt
{
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos + 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  unsigned int v6 = *((char *)&bytes->super.size_ + pos + 4);
  if ((v6 & 0x80000000) != 0)
  {
    int v7 = v6 & 0x7F;
    int v8 = self->bytes_;
    int v9 = self->pos_;
    self->pos_ = v9 + 1;
    uint64_t v10 = v8->super.size_;
    if (v9 < 0 || v9 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v9);
    }
    int v11 = *((char *)&v8->super.size_ + v9 + 4);
    unsigned int v6 = v7 & 0xFFFFC07F | ((v11 & 0x7F) << 7);
    if (v11 < 0)
    {
      int v12 = self->bytes_;
      int v13 = self->pos_;
      self->pos_ = v13 + 1;
      uint64_t v14 = v12->super.size_;
      if (v13 < 0 || v13 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v13);
      }
      int v15 = *((char *)&v12->super.size_ + v13 + 4);
      unsigned int v6 = v6 & 0xFFE03FFF | ((v15 & 0x7F) << 14);
      if (v15 < 0)
      {
        uint64_t v16 = self->bytes_;
        int v17 = self->pos_;
        self->pos_ = v17 + 1;
        uint64_t v18 = v16->super.size_;
        if (v17 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v17);
        }
        int v19 = *((char *)&v16->super.size_ + v17 + 4);
        unsigned int v6 = v6 & 0xF01FFFFF | ((v19 & 0x7F) << 21);
        if (v19 < 0)
        {
          uint64_t v20 = self->bytes_;
          int v21 = self->pos_;
          self->pos_ = v21 + 1;
          uint64_t v22 = v20->super.size_;
          if (v21 < 0 || v21 >= (int)v22) {
            IOSArray_throwOutOfBoundsWithMsg(v22, v21);
          }
          unsigned int v23 = *((unsigned __int8 *)&v20->super.size_ + v21 + 4);
          if (v23 > 0xF)
          {
            v25 = new_JavaLangRuntimeException_initWithNSString_(@"Invalid vInt detected (too many bits)");
            objc_exception_throw(v25);
          }
          v6 |= v23 << 28;
        }
      }
    }
  }
  return v6;
}

- (int64_t)readVLong
{
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos + 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  int64_t result = *((unsigned __int8 *)&bytes->super.size_ + pos + 4);
  if (*((char *)&bytes->super.size_ + pos + 4) < 0)
  {
    int64_t v7 = result & 0x7F;
    int v8 = self->bytes_;
    int v9 = self->pos_;
    self->pos_ = v9 + 1;
    uint64_t v10 = v8->super.size_;
    if (v9 < 0 || v9 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v9);
    }
    int v11 = *((char *)&v8->super.size_ + v9 + 4);
    int64_t result = v7 | ((unint64_t)(v11 & 0x7F) << 7);
    if (v11 < 0)
    {
      int v12 = self->bytes_;
      int v13 = self->pos_;
      self->pos_ = v13 + 1;
      if (v13 < 0 || v13 >= v12->super.size_) {
        IOSArray_throwOutOfBoundsWithMsg(v12->super.size_, v13);
      }
      int v14 = *((char *)&v12->super.size_ + v13 + 4);
      result |= (unint64_t)(v14 & 0x7F) << 14;
      if (v14 < 0)
      {
        int v15 = self->bytes_;
        int v16 = self->pos_;
        self->pos_ = v16 + 1;
        if (v16 < 0 || v16 >= v15->super.size_) {
          IOSArray_throwOutOfBoundsWithMsg(v15->super.size_, v16);
        }
        int v17 = *((char *)&v15->super.size_ + v16 + 4);
        result |= (unint64_t)(v17 & 0x7F) << 21;
        if (v17 < 0)
        {
          uint64_t v18 = self->bytes_;
          int v19 = self->pos_;
          self->pos_ = v19 + 1;
          if (v19 < 0 || v19 >= v18->super.size_) {
            IOSArray_throwOutOfBoundsWithMsg(v18->super.size_, v19);
          }
          int v20 = *((char *)&v18->super.size_ + v19 + 4);
          result |= (unint64_t)(v20 & 0x7F) << 28;
          if (v20 < 0)
          {
            int v21 = self->bytes_;
            int v22 = self->pos_;
            self->pos_ = v22 + 1;
            if (v22 < 0 || v22 >= v21->super.size_) {
              IOSArray_throwOutOfBoundsWithMsg(v21->super.size_, v22);
            }
            int v23 = *((char *)&v21->super.size_ + v22 + 4);
            result |= (unint64_t)(v23 & 0x7F) << 35;
            if (v23 < 0)
            {
              uint64_t v24 = self->bytes_;
              int v25 = self->pos_;
              self->pos_ = v25 + 1;
              if (v25 < 0 || v25 >= v24->super.size_) {
                IOSArray_throwOutOfBoundsWithMsg(v24->super.size_, v25);
              }
              int v26 = *((char *)&v24->super.size_ + v25 + 4);
              result |= (unint64_t)(v26 & 0x7F) << 42;
              if (v26 < 0)
              {
                v27 = self->bytes_;
                int v28 = self->pos_;
                self->pos_ = v28 + 1;
                if (v28 < 0 || v28 >= v27->super.size_) {
                  IOSArray_throwOutOfBoundsWithMsg(v27->super.size_, v28);
                }
                int v29 = *((char *)&v27->super.size_ + v28 + 4);
                result |= (unint64_t)(v29 & 0x7F) << 49;
                if (v29 < 0)
                {
                  v30 = self->bytes_;
                  int v31 = self->pos_;
                  self->pos_ = v31 + 1;
                  if (v31 < 0 || v31 >= v30->super.size_) {
                    IOSArray_throwOutOfBoundsWithMsg(v30->super.size_, v31);
                  }
                  int v32 = *((char *)&v30->super.size_ + v31 + 4);
                  if (v32 < 0)
                  {
                    v33 = new_JavaLangRuntimeException_initWithNSString_(@"Invalid vLong detected (negative values disallowed)");
                    objc_exception_throw(v33);
                  }
                  return result | ((unint64_t)v32 << 56);
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

- (char)readByte
{
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos + 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  return *((unsigned char *)&bytes->super.size_ + pos + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreByteArrayDataInput;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end