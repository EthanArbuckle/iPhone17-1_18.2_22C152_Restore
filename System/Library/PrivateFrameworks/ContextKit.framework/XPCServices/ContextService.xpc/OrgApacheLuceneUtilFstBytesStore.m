@interface OrgApacheLuceneUtilFstBytesStore
+ (void)initialize;
- (NSString)description;
- (OrgApacheLuceneUtilFstBytesStore)initWithInt:(int)a3;
- (OrgApacheLuceneUtilFstBytesStore)initWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (id)getForwardReader;
- (id)getReverseReader;
- (id)getReverseReaderWithBoolean:(BOOL)a3;
- (int)getBlockBits;
- (int64_t)getPosition;
- (int64_t)ramBytesUsed;
- (void)copyBytesWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)dealloc;
- (void)finish;
- (void)reverseWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)skipBytesWithInt:(int)a3;
- (void)truncateWithLong:(int64_t)a3;
- (void)writeByteWithByte:(char)a3;
- (void)writeByteWithInt:(int)a3 withByte:(char)a4;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeBytesWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)writeIntWithLong:(int64_t)a3 withInt:(int)a4;
- (void)writeToWithOrgApacheLuceneStoreDataOutput:(id)a3;
@end

@implementation OrgApacheLuceneUtilFstBytesStore

- (OrgApacheLuceneUtilFstBytesStore)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneUtilFstBytesStore)initWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  return self;
}

- (void)writeByteWithInt:(int)a3 withByte:(char)a4
{
  blocks = self->blocks_;
  if (!blocks
    || (v9 = (unsigned int *)[(JavaUtilList *)blocks getWithInt:(a3 >> self->blockBits_)]) == 0)
  {
    JreThrowNullPointerException();
  }
  v10 = v9;
  uint64_t v11 = self->blockMask_ & a3;
  uint64_t v12 = v9[2];
  if ((self->blockMask_ & a3) < 0 != v8 || (int)v11 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v11);
  }
  *((unsigned char *)v10 + (int)v11 + 12) = a4;
}

- (void)writeByteWithByte:(char)a3
{
  uint64_t nextWrite = self->nextWrite_;
  if (nextWrite == self->blockSize_)
  {
    uint64_t v6 = (int)nextWrite;
    p_current = &self->current_;
    JreStrongAssignAndConsume((id *)&self->current_, +[IOSByteArray newArrayWithLength:v6]);
    blocks = self->blocks_;
    if (!blocks) {
      goto LABEL_8;
    }
    [(JavaUtilList *)blocks addWithId:*p_current];
    uint64_t nextWrite = 0;
    self->nextWrite_ = 0;
  }
  current = self->current_;
  if (!current) {
LABEL_8:
  }
    JreThrowNullPointerException();
  self->nextWrite_ = nextWrite + 1;
  uint64_t size = current->super.size_;
  if ((nextWrite & 0x80000000) != 0 || (int)nextWrite >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, nextWrite);
  }
  *((unsigned char *)&current->super.size_ + (int)nextWrite + 4) = a3;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    for (uint64_t i = self->nextWrite_; ; uint64_t i = 0)
    {
      int blockSize = self->blockSize_;
      int v11 = blockSize - i;
      if ((int)v5 <= blockSize - (int)i) {
        break;
      }
      if (v11 >= 1)
      {
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, self->current_, i, (blockSize - i));
        uint64_t v6 = (v11 + v6);
        int blockSize = self->blockSize_;
        uint64_t v5 = (v5 - v11);
      }
      JreStrongAssignAndConsume((id *)&self->current_, +[IOSByteArray newArrayWithLength:blockSize]);
      blocks = self->blocks_;
      if (!blocks) {
        JreThrowNullPointerException();
      }
      [(JavaUtilList *)blocks addWithId:self->current_];
      self->nextWrite_ = 0;
      if ((int)v5 <= 0) {
        return;
      }
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, self->current_, i, v5);
    self->nextWrite_ += v5;
  }
}

- (int)getBlockBits
{
  return self->blockBits_;
}

- (void)writeBytesWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  int64_t v10 = a3 + a6;
  uint64_t v11 = v10 >> self->blockBits_;
  int blockMask = self->blockMask_;
  uint64_t blockSize = blockMask & v10;
  if ((blockMask & v10) == 0)
  {
    uint64_t v11 = (v11 - 1);
    uint64_t blockSize = self->blockSize_;
  }
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  id v15 = [(JavaUtilList *)blocks getWithInt:v11];
  if ((int)v6 >= 1)
  {
    id v16 = v15;
    uint64_t v17 = (v11 - 1);
    while (1)
    {
      uint64_t v18 = (v6 - blockSize);
      if ((int)v6 <= (int)blockSize) {
        break;
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a4, (v18 + v7), v16, 0, blockSize);
      id v16 = [(JavaUtilList *)self->blocks_ getWithInt:v17];
      uint64_t blockSize = self->blockSize_;
      uint64_t v17 = (v17 - 1);
      uint64_t v6 = v18;
      if ((int)v18 <= 0) {
        return;
      }
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a4, v7, v16, (blockSize - v6), v6);
  }
}

- (void)copyBytesWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int64_t v8 = a3 + a5;
  uint64_t v9 = v8 >> self->blockBits_;
  int blockMask = self->blockMask_;
  uint64_t blockSize = blockMask & v8;
  if ((blockMask & v8) == 0)
  {
    uint64_t v9 = (v9 - 1);
    uint64_t blockSize = self->blockSize_;
  }
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  id v13 = [(JavaUtilList *)blocks getWithInt:v9];
  if ((int)v5 >= 1)
  {
    id v14 = v13;
    uint64_t v15 = (v9 - 1);
    while (1)
    {
      uint64_t v16 = (v5 - blockSize);
      if ((int)v5 <= (int)blockSize) {
        break;
      }
      [(OrgApacheLuceneUtilFstBytesStore *)self writeBytesWithLong:a4 + (int)v16 withByteArray:v14 withInt:0 withInt:blockSize];
      id v14 = [(JavaUtilList *)self->blocks_ getWithInt:v15];
      uint64_t blockSize = self->blockSize_;
      uint64_t v15 = (v15 - 1);
      uint64_t v5 = v16;
      if ((int)v16 <= 0) {
        return;
      }
    }
    [(OrgApacheLuceneUtilFstBytesStore *)self writeBytesWithLong:a4 withByteArray:v14 withInt:(blockSize - v5) withInt:v5];
  }
}

- (void)writeIntWithLong:(int64_t)a3 withInt:(int)a4
{
  blocks = self->blocks_;
  if (!blocks) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v7 = self->blockMask_ & a3;
  int64_t v8 = a3 >> self->blockBits_;
  uint64_t v9 = [(JavaUtilList *)blocks getWithInt:v8];
  for (int i = 24; i != -8; i -= 8)
  {
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v11 = *((unsigned int *)v9 + 2);
    if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v7);
    }
    uint64_t v12 = (v7 + 1);
    v9[(int)v7 + 12] = a4 >> (i & 0x18);
    if (v12 == self->blockSize_)
    {
      int64_t v8 = (v8 + 1);
      uint64_t v9 = [(JavaUtilList *)self->blocks_ getWithInt:v8];
      uint64_t v12 = 0;
    }
    uint64_t v7 = v12;
  }
}

- (void)reverseWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  blocks = self->blocks_;
  if (!blocks) {
    goto LABEL_28;
  }
  unsigned int v7 = a3;
  int blockMask = self->blockMask_;
  int64_t v24 = a3 >> self->blockBits_;
  uint64_t v9 = -[JavaUtilList getWithInt:](blocks, "getWithInt:");
  int v10 = self->blockMask_;
  int64_t v23 = a4 >> self->blockBits_;
  uint64_t v11 = -[JavaUtilList getWithInt:](self->blocks_, "getWithInt:");
  int v12 = a4 - v7 + 1;
  if (v12 >= 0) {
    int v13 = a4 - v7 + 1;
  }
  else {
    int v13 = a4 - v7 + 2;
  }
  if (v12 >= 2)
  {
    id v14 = v11;
    int v15 = v13 >> 1;
    uint64_t v16 = v10 & a4;
    uint64_t v17 = blockMask & v7;
    while (v9)
    {
      uint64_t v18 = *((unsigned int *)v9 + 2);
      if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v17);
      }
      if (!v14) {
        break;
      }
      char v19 = v9[(int)v17 + 12];
      uint64_t v20 = *((unsigned int *)v14 + 2);
      if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, v16);
      }
      uint64_t v21 = *((unsigned int *)v9 + 2);
      if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v21) {
        IOSArray_throwOutOfBoundsWithMsg(v21, v17);
      }
      v9[(int)v17 + 12] = v14[(int)v16 + 12];
      uint64_t v22 = *((unsigned int *)v14 + 2);
      if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v16);
      }
      v14[(int)v16 + 12] = v19;
      uint64_t v17 = (v17 + 1);
      if (v17 == self->blockSize_)
      {
        LODWORD(v24) = v24 + 1;
        uint64_t v9 = -[JavaUtilList getWithInt:](self->blocks_, "getWithInt:");
        uint64_t v17 = 0;
      }
      if (!v16)
      {
        LODWORD(v23) = v23 - 1;
        id v14 = -[JavaUtilList getWithInt:](self->blocks_, "getWithInt:");
        LODWORD(v16) = self->blockSize_;
      }
      uint64_t v16 = (v16 - 1);
      if (!--v15) {
        return;
      }
    }
LABEL_28:
    JreThrowNullPointerException();
  }
}

- (void)skipBytesWithInt:(int)a3
{
  if (a3 >= 1)
  {
    int nextWrite = self->nextWrite_;
    while (1)
    {
      int v5 = self->blockSize_ - nextWrite;
      int v6 = a3 - v5;
      if (a3 <= v5) {
        break;
      }
      JreStrongAssignAndConsume((id *)&self->current_, +[IOSByteArray newArrayWithLength:self->blockSize_]);
      blocks = self->blocks_;
      if (!blocks) {
        JreThrowNullPointerException();
      }
      [(JavaUtilList *)blocks addWithId:self->current_];
      int nextWrite = 0;
      self->nextWrite_ = 0;
      a3 = v6;
      if (v6 <= 0) {
        return;
      }
    }
    self->nextWrite_ = nextWrite + a3;
  }
}

- (int64_t)getPosition
{
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  return self->nextWrite_ + ((int)[(JavaUtilList *)blocks size] - 1) * self->blockSize_;
}

- (void)truncateWithLong:(int64_t)a3
{
  int64_t v5 = a3 >> self->blockBits_;
  BOOL v6 = (self->blockMask_ & a3) == 0;
  self->nextWrite_ = self->blockMask_ & a3;
  if (v6)
  {
    int64_t v5 = (v5 - 1);
    self->nextWrite_ = self->blockSize_;
  }
  blocks = self->blocks_;
  if (!blocks
    || (id v8 = [(JavaUtilList *)blocks subListWithInt:(v5 + 1) withInt:[(JavaUtilList *)self->blocks_ size]]) == 0)
  {
    JreThrowNullPointerException();
  }
  [v8 clear];
  if (a3) {
    id v9 = [(JavaUtilList *)self->blocks_ getWithInt:v5];
  }
  else {
    id v9 = 0;
  }
  JreStrongAssign((id *)&self->current_, v9);
}

- (void)finish
{
  p_current = &self->current_;
  if (self->current_)
  {
    v4 = +[IOSByteArray arrayWithLength:self->nextWrite_];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*p_current, 0, v4, 0, self->nextWrite_);
    blocks = self->blocks_;
    if (!blocks) {
      JreThrowNullPointerException();
    }
    [(JavaUtilList *)blocks setWithInt:[(JavaUtilList *)blocks size] - 1 withId:v4];
    JreStrongAssign((id *)p_current, 0);
  }
}

- (void)writeToWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  blocks = self->blocks_;
  if (!blocks) {
LABEL_12:
  }
    JreThrowNullPointerException();
  id v5 = [(JavaUtilList *)self->blocks_ countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(blocks);
        }
        if (!a3) {
          goto LABEL_12;
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_12;
        }
        objc_msgSend(a3, "writeBytesWithByteArray:withInt:withInt:", v9, 0, *(unsigned int *)(v9 + 8), (void)v10);
      }
      id v6 = [(JavaUtilList *)blocks countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)getForwardReader
{
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilList *)blocks size] == 1)
  {
    v4 = (OrgApacheLuceneUtilFstBytesStore_$1 *)new_OrgApacheLuceneUtilFstForwardBytesReader_initWithByteArray_([(JavaUtilList *)self->blocks_ getWithInt:0]);
  }
  else
  {
    v4 = [OrgApacheLuceneUtilFstBytesStore__1 alloc];
    JreStrongAssign((id *)&v4->this$0_, self);
    OrgApacheLuceneUtilFstFST_BytesReader_init(v4, v5);
    v4->nextRead_ = self->blockSize_;
  }
  return v4;
}

- (id)getReverseReader
{
  return [(OrgApacheLuceneUtilFstBytesStore *)self getReverseReaderWithBoolean:1];
}

- (id)getReverseReaderWithBoolean:(BOOL)a3
{
  if (!a3) {
    goto LABEL_5;
  }
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilList *)blocks size] == 1)
  {
    uint64_t v5 = (OrgApacheLuceneUtilFstBytesStore_$2 *)new_OrgApacheLuceneUtilFstReverseBytesReader_initWithByteArray_([(JavaUtilList *)self->blocks_ getWithInt:0]);
  }
  else
  {
LABEL_5:
    uint64_t v5 = [OrgApacheLuceneUtilFstBytesStore__2 alloc];
    sub_1000DB248((uint64_t)v5, (id *)&self->super.super.isa);
  }
  return v5;
}

- (int64_t)ramBytesUsed
{
  int64_t v2 = qword_100560380;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilList *)self->blocks_ countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (int i = 0; i != v5; int i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(blocks);
        }
        v2 += OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_(*(void *)(*((void *)&v9 + 1)
                                                                                  + 8 * i));
      }
      id v5 = [(JavaUtilList *)blocks countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v2;
}

- (NSString)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneUtilFstBytesStore getClass](self, "getClass"), "getSimpleName");
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  [(JavaUtilList *)blocks size];
  return (NSString *)JreStrcat("$$IC", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBytesStore;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    int64_t v2 = (void *)OrgApacheLuceneUtilFstBytesStore_class_();
    uint64_t v3 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    id v4 = (void *)JavaUtilArrayList_class_();
    qword_100560380 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v4) + v3;
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilFstBytesStore__initialized);
  }
}

@end