@interface JavaUtilZipCRC32
+ (const)__metadata;
- (JavaUtilZipCRC32)init;
- (int64_t)getValue;
- (int64_t)updateByteImplWithByte:(char)a3 withLong:(int64_t)a4;
- (int64_t)updateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)reset;
- (void)updateWithByteArray:(id)a3;
- (void)updateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)updateWithInt:(int)a3;
@end

@implementation JavaUtilZipCRC32

- (int64_t)getValue
{
  return self->crc_;
}

- (void)reset
{
  self->tbytes_ = 0;
  self->crc_ = 0;
}

- (void)updateWithInt:(int)a3
{
  uLong crc = self->crc_;
  Bytef buf = a3;
  self->crc_ = crc32(crc, &buf, 1u);
}

- (void)updateWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaUtilZipCRC32 *)self updateWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)updateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  uLong crc = self->crc_;
  self->tbytes_ += a5;
  self->crc_ = crc32(crc, (const Bytef *)a3 + a4 + 12, a5);
}

- (int64_t)updateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  return crc32(a6, (const Bytef *)a3 + a4 + 12, a5);
}

- (int64_t)updateByteImplWithByte:(char)a3 withLong:(int64_t)a4
{
  Bytef buf = a3;
  return crc32(a4, &buf, 1u);
}

- (JavaUtilZipCRC32)init
{
  self->tbytes_ = 0;
  self->crc_ = 0;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100449C40;
}

@end