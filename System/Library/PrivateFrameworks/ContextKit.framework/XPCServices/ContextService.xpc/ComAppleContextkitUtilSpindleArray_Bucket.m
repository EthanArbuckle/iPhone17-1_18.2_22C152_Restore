@interface ComAppleContextkitUtilSpindleArray_Bucket
- (BOOL)skipToEntryIdWithComAppleContextkitUtilSpindleArray_State:(id)a3 withInt:(int)a4;
- (ComAppleContextkitUtilSpindleArray_Bucket)initWithComAppleContextkitUtilSpindleArray:(id)a3 withComAppleContextkitUtilSpindleArray_State:(id)a4 withOrgApacheLuceneStoreIndexInput:(id)a5 withIntArray:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8;
- (void)completeEntryWithComAppleContextkitUtilSpindleArray_State:(id)a3;
- (void)dealloc;
@end

@implementation ComAppleContextkitUtilSpindleArray_Bucket

- (ComAppleContextkitUtilSpindleArray_Bucket)initWithComAppleContextkitUtilSpindleArray:(id)a3 withComAppleContextkitUtilSpindleArray_State:(id)a4 withOrgApacheLuceneStoreIndexInput:(id)a5 withIntArray:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8
{
  return self;
}

- (void)completeEntryWithComAppleContextkitUtilSpindleArray_State:(id)a3
{
  self->startOffset_ = self->bytesRead_;
  do
  {
    uncompressed = self->uncompressed_;
    if (!uncompressed) {
      JreThrowNullPointerException();
    }
    int bytesRead = self->bytesRead_;
    self->bytesRead_ = bytesRead + 1;
    uint64_t size = uncompressed->super.size_;
    if (bytesRead < 0 || bytesRead >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, bytesRead);
    }
  }
  while (*((unsigned char *)&uncompressed->super.size_ + bytesRead + 4));
  self->entryLength_ = self->bytesRead_ - self->startOffset_;
}

- (BOOL)skipToEntryIdWithComAppleContextkitUtilSpindleArray_State:(id)a3 withInt:(int)a4
{
  if (self->currentEntryId_ < a4)
  {
    while (1)
    {
      uncompressed = self->uncompressed_;
      if (!uncompressed) {
LABEL_20:
      }
        JreThrowNullPointerException();
      int bytesRead = self->bytesRead_;
      self->bytesRead_ = bytesRead + 1;
      uint64_t size = uncompressed->super.size_;
      if (bytesRead < 0 || bytesRead >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, bytesRead);
      }
      if (!*((unsigned char *)&uncompressed->super.size_ + bytesRead + 4))
      {
        int v8 = self->currentEntryId_ + 1;
        self->currentEntryId_ = v8;
        if (v8 >= a4) {
          break;
        }
      }
    }
  }
  uint64_t v9 = self->bytesRead_;
  self->startOffset_ = v9;
  if ((int)v9 >= self->numBytesDecompressed_)
  {
    BOOL result = 0;
    int v13 = v9;
  }
  else
  {
    do
    {
      v10 = self->uncompressed_;
      if (!v10) {
        goto LABEL_20;
      }
      uint64_t v11 = v10->super.size_;
      if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v9);
      }
      BOOL result = *((unsigned char *)&v10->super.size_ + (int)v9 + 4) == 0;
      if (!*((unsigned char *)&v10->super.size_ + (int)v9 + 4)) {
        break;
      }
      uint64_t v9 = (v9 + 1);
      self->bytesRead_ = v9;
    }
    while ((int)v9 < self->numBytesDecompressed_);
    int v13 = v9;
    LODWORD(v9) = self->startOffset_;
  }
  self->entryLength_ = v13 - v9;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilSpindleArray_Bucket;
  [(ComAppleContextkitUtilSpindleArray_Bucket *)&v3 dealloc];
}

@end