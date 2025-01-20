@interface ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld
- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4;
- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4 withId:(id)a5 withLong:(int64_t)a6 withLong:(int64_t)a7;
- (char)readByte;
- (char)readByteWithLong:(int64_t)a3;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int)readInt;
- (int)readIntWithLong:(int64_t)a3;
- (int)readVInt;
- (int64_t)getFilePointer;
- (int64_t)length;
- (int64_t)readLong;
- (int64_t)readLongWithLong:(int64_t)a3;
- (int64_t)readVLong;
- (int64_t)readVLongWithBoolean:(BOOL)a3;
- (int64_t)readZLong;
- (signed)readShort;
- (signed)readShortWithLong:(int64_t)a3;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld

- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4 withId:(id)a5 withLong:(int64_t)a6 withLong:(int64_t)a7
{
  return self;
}

- (int64_t)getFilePointer
{
  return self->pos_ + self->sliceOffset_;
}

- (void)seekWithLong:(int64_t)a3
{
  self->pos_ = a3;
}

- (int64_t)length
{
  return self->length_;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  int v6 = a4;
  v8 = self->this$0_;
  if (v8->useMadvise_)
  {
    madvise((char *)objc_msgSend(self->nsData_, "bytes", a3) + a4, a5, 3);
    v8 = self->this$0_;
  }
  name = self->name_;
  id nsData = self->nsData_;
  v11 = [ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld alloc];
  sub_100045938((uint64_t)v11, v8, name, nsData, v6, a5);
  return v11;
}

- (char)readByte
{
  char v4 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v4, self->pos_ + self->sliceOffset_, 1);
  ++self->pos_;
  return v4;
}

- (void)skipBytesWithLong:(int64_t)a3
{
  self->pos_ += a3;
}

- (signed)readShort
{
  signed __int16 result = [(ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld *)self readShortWithLong:self->pos_];
  self->pos_ += 2;
  return result;
}

- (int)readInt
{
  int result = [(ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld *)self readIntWithLong:self->pos_];
  self->pos_ += 4;
  return result;
}

- (int64_t)readLong
{
  int64_t result = [(ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld *)self readLongWithLong:self->pos_];
  self->pos_ += 8;
  return result;
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (char)readByteWithLong:(int64_t)a3
{
  char v4 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v4, self->sliceOffset_ + (int)a3, 1);
  return v4;
}

- (signed)readShortWithLong:(int64_t)a3
{
  unsigned __int16 v5 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v5, self->sliceOffset_ + (int)a3, 2);
  return (int)bswap32(v5) >> 16;
}

- (int)readIntWithLong:(int64_t)a3
{
  unsigned int v4 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v4, self->sliceOffset_ + (int)a3, 4);
  return bswap32(v4);
}

- (int64_t)readLongWithLong:(int64_t)a3
{
  unint64_t v4 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v4, self->sliceOffset_ + (int)a3, 8);
  return bswap64(v4);
}

- (int)readVInt
{
  uint64_t v6 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v6, self->pos_ + self->sliceOffset_, 8);
  int result = (char)v6;
  if ((char)v6 < 0)
  {
    int result = v6 & 0x7F | ((SBYTE1(v6) & 0x7F) << 7);
    if (SBYTE1(v6) < 0)
    {
      int result = v6 & 0x7F | ((SBYTE1(v6) & 0x7F) << 7) & 0x3FFF | ((SBYTE2(v6) & 0x7F) << 14);
      if (SBYTE2(v6) < 0)
      {
        int result = v6 & 0x7F | ((SBYTE1(v6) & 0x7F) << 7) & 0x3FFF | ((SBYTE2(v6) & 0x7F) << 14) & 0xF01FFFFF | ((SBYTE3(v6) & 0x7F) << 21);
        if (SBYTE3(v6) < 0)
        {
          if (BYTE4(v6) > 0xFu)
          {
            unsigned __int16 v5 = new_JavaIoIOException_initWithNSString_(@"Invalid vInt detected (too many bits)");
            objc_exception_throw(v5);
          }
          result |= BYTE4(v6) << 28;
          int v4 = 5;
        }
        else
        {
          int v4 = 4;
        }
      }
      else
      {
        int v4 = 3;
      }
    }
    else
    {
      int v4 = 2;
    }
  }
  else
  {
    int v4 = 1;
  }
  self->pos_ += v4;
  return result;
}

- (int64_t)readVLong
{
  return sub_100045EF8((uint64_t)self, 0);
}

- (int64_t)readVLongWithBoolean:(BOOL)a3
{
  return sub_100045EF8((uint64_t)self, a3);
}

- (int64_t)readZLong
{
  unint64_t v2 = sub_100045EF8((uint64_t)self, 1);
  return OrgApacheLuceneUtilBitUtil_zigZagDecodeWithLong_(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end