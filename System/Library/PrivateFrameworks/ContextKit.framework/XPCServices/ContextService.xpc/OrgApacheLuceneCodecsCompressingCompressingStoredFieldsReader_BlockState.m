@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState
- (BOOL)containsWithInt:(int)a3;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3;
- (id)documentWithInt:(int)a3;
- (void)__javaClone;
- (void)dealloc;
- (void)doResetWithInt:(int)a3;
- (void)resetWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState

- (BOOL)containsWithInt:(int)a3
{
  int docBase = self->docBase_;
  return docBase <= a3 && self->chunkDocs_ + docBase > a3;
}

- (void)resetWithInt:(int)a3
{
}

- (void)doResetWithInt:(int)a3
{
}

- (id)documentWithInt:(int)a3
{
  if (!-[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState containsWithInt:](self, "containsWithInt:"))
  {
    v35 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v35);
  }
  offsets = self->offsets_;
  if (!offsets) {
    goto LABEL_29;
  }
  uint64_t v6 = (a3 - self->docBase_);
  uint64_t v7 = (int)v6;
  uint64_t size = offsets->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 - self->docBase_));
  }
  uint64_t v9 = *((unsigned int *)&offsets->super.size_ + (int)v6 + 1);
  int v10 = v6 + 1;
  if ((int)v6 + 1 < 0 || v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  int v11 = *(&self->offsets_->super.size_ + v10 + 1);
  int chunkDocs = self->chunkDocs_;
  if (chunkDocs < 0 || chunkDocs >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, chunkDocs);
  }
  numStoredFields = self->numStoredFields_;
  if (!numStoredFields) {
    goto LABEL_29;
  }
  uint64_t v14 = *((unsigned int *)&self->offsets_->super.size_ + chunkDocs + 1);
  uint64_t v15 = numStoredFields->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v6);
  }
  uint64_t v16 = (v11 - v9);
  int v17 = *(&numStoredFields->super.size_ + v7 + 1);
  if (v11 == v9)
  {
    v18 = new_OrgApacheLuceneStoreByteArrayDataInput_init();
LABEL_18:
    v23 = (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState_$1 *)v18;
    goto LABEL_19;
  }
  if (*((unsigned char *)objc_loadWeak((id *)&self->this$0_) + 76))
  {
    bytes = self->bytes_;
    if (bytes)
    {
      uint64_t v20 = (uint64_t)bytes->bytes_;
      uint64_t offset = (bytes->offset_ + v9);
      uint64_t length = (v11 - v9);
LABEL_17:
      v18 = new_OrgApacheLuceneStoreByteArrayDataInput_initWithByteArray_withInt_withInt_(v20, offset, length);
      goto LABEL_18;
    }
    goto LABEL_29;
  }
  BOOL sliced = self->sliced_;
  v28 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 5);
  if (!sliced)
  {
    if (v28)
    {
      [v28 seekWithLong:self->startPointer_];
      v33 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 8);
      if (v33)
      {
        [v33 decompressWithOrgApacheLuceneStoreDataInput:*(objc_loadWeak((id *)&self->this$0_) + 5) withInt:v14 withInt:v9 withInt:(v11 - v9) withOrgApacheLuceneUtilBytesRef:self->bytes_];
        v34 = self->bytes_;
        uint64_t v20 = (uint64_t)v34->bytes_;
        uint64_t offset = v34->offset_;
        uint64_t length = v34->length_;
        goto LABEL_17;
      }
    }
LABEL_29:
    JreThrowNullPointerException();
  }
  if (!v28) {
    goto LABEL_29;
  }
  [v28 seekWithLong:self->startPointer_];
  v29 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 8);
  if (!v29) {
    goto LABEL_29;
  }
  uint64_t v30 = *(objc_loadWeak((id *)&self->this$0_) + 5);
  uint64_t v31 = *((unsigned int *)objc_loadWeak((id *)&self->this$0_) + 12);
  Weak = objc_loadWeak((id *)&self->this$0_);
  objc_msgSend(v29, "decompressWithOrgApacheLuceneStoreDataInput:withInt:withInt:withInt:withOrgApacheLuceneUtilBytesRef:", v30, v31, v9, JavaLangMath_minWithInt_withInt_(v16, Weak[12] - (int)v9), self->bytes_);
  v23 = [OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState__1 alloc];
  sub_1000AB9FC((uint64_t)v23, self, v16);
LABEL_19:
  v24 = v23;
  v25 = [OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_SerializedDocument alloc];
  JreStrongAssign((id *)&v25->in_, v24);
  v25->length_ = v16;
  v25->numStoredFields_ = v17;
  return v25;
}

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState)initWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_BlockState *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end