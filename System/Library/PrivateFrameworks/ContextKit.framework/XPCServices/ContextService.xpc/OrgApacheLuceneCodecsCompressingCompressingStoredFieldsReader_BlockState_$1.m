@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState:(id)a3 withInt:(int)a4;
- (char)readByte;
- (void)dealloc;
- (void)fillBuffer;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1

- (void)fillBuffer
{
  int decompressed = self->decompressed_;
  int v3 = self->val$length_;
  uint64_t v4 = (v3 - decompressed);
  if (v3 == decompressed)
  {
    v9 = new_JavaIoEOFException_init();
    objc_exception_throw(v9);
  }
  Weak = objc_loadWeak((id *)&self->this$0_->this$0_);
  uint64_t v7 = JavaLangMath_minWithInt_withInt_(v4, Weak[12]);
  v8 = (void *)*(objc_loadWeak((id *)&self->this$0_->this$0_) + 8);
  if (!v8) {
    JreThrowNullPointerException();
  }
  [v8 decompressWithOrgApacheLuceneStoreDataInput:*(objc_loadWeak((id *)&self->this$0_->this$0_) + 5) withInt:v7 withInt:0 withInt:v7 withOrgApacheLuceneUtilBytesRef:self->this$0_->bytes_];
  self->decompressed_ += v7;
}

- (char)readByte
{
  bytes = self->this$0_->bytes_;
  if (!bytes) {
    goto LABEL_8;
  }
  int length = bytes->length_;
  if (!length)
  {
    [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1 *)self fillBuffer];
    bytes = self->this$0_->bytes_;
    int length = bytes->length_;
  }
  bytes->length_ = length - 1;
  v5 = self->this$0_->bytes_;
  v6 = v5->bytes_;
  if (!v6) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int offset = v5->offset_;
  v5->offset_ = offset + 1;
  uint64_t size = v6->super.size_;
  if (offset < 0 || offset >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, offset);
  }
  return *((unsigned char *)&v6->super.size_ + offset + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  bytes = self->this$0_->bytes_;
  if (!bytes) {
LABEL_5:
  }
    JreThrowNullPointerException();
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  while (1)
  {
    uint64_t length = bytes->length_;
    v11 = bytes->bytes_;
    uint64_t offset = bytes->offset_;
    if ((int)v6 <= (int)length) {
      break;
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v11, offset, a3, v7, length);
    int v13 = self->this$0_->bytes_->length_;
    uint64_t v6 = (v6 - v13);
    uint64_t v7 = (v13 + v7);
    [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1 *)self fillBuffer];
    bytes = self->this$0_->bytes_;
    if (!bytes) {
      goto LABEL_5;
    }
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v11, offset, a3, v7, v6);
  self->this$0_->bytes_->offset_ += v6;
  self->this$0_->bytes_->length_ -= v6;
}

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState__1;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end