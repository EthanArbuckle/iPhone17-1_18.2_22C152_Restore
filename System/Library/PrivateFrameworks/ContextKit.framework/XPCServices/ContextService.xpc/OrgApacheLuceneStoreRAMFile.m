@interface OrgApacheLuceneStoreRAMFile
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (OrgApacheLuceneStoreRAMFile)init;
- (OrgApacheLuceneStoreRAMFile)initWithOrgApacheLuceneStoreRAMDirectory:(id)a3;
- (id)addBufferWithInt:(int)a3;
- (id)getBufferWithInt:(int)a3;
- (id)newBufferWithInt:(int)a3;
- (int)numBuffers;
- (int64_t)getLength;
- (int64_t)ramBytesUsed;
- (unint64_t)hash;
- (void)dealloc;
- (void)setLengthWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreRAMFile

- (OrgApacheLuceneStoreRAMFile)init
{
  p_buffers = &self->buffers_;
  v4 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_buffers, v4);
  return self;
}

- (OrgApacheLuceneStoreRAMFile)initWithOrgApacheLuceneStoreRAMDirectory:(id)a3
{
  p_buffers = &self->buffers_;
  v6 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_buffers, v6);
  JreStrongAssign((id *)&self->directory_, a3);
  return self;
}

- (int64_t)getLength
{
  objc_sync_enter(self);
  int64_t length = self->length_;
  objc_sync_exit(self);
  return length;
}

- (void)setLengthWithLong:(int64_t)a3
{
  objc_sync_enter(self);
  self->length_ = a3;
  objc_sync_exit(self);
}

- (id)addBufferWithInt:(int)a3
{
  id v5 = -[OrgApacheLuceneStoreRAMFile newBufferWithInt:](self, "newBufferWithInt:");
  objc_sync_enter(self);
  buffers = self->buffers_;
  if (!buffers) {
    JreThrowNullPointerException();
  }
  [(JavaUtilArrayList *)buffers addWithId:v5];
  self->sizeInBytes_ += a3;
  objc_sync_exit(self);
  directory = self->directory_;
  if (directory)
  {
    sizeInBytes = directory->sizeInBytes_;
    if (!sizeInBytes) {
      JreThrowNullPointerException();
    }
    [(JavaUtilConcurrentAtomicAtomicLong *)sizeInBytes getAndAddWithLong:a3];
  }
  return v5;
}

- (id)getBufferWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  buffers = self->buffers_;
  if (!buffers) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilArrayList *)buffers getWithInt:v3];
  objc_sync_exit(self);
  return v6;
}

- (int)numBuffers
{
  objc_sync_enter(self);
  buffers = self->buffers_;
  if (!buffers) {
    JreThrowNullPointerException();
  }
  int v4 = [(JavaUtilArrayList *)buffers size];
  objc_sync_exit(self);
  return v4;
}

- (id)newBufferWithInt:(int)a3
{
  return +[IOSByteArray arrayWithLength:a3];
}

- (int64_t)ramBytesUsed
{
  objc_sync_enter(self);
  int64_t sizeInBytes = self->sizeInBytes_;
  objc_sync_exit(self);
  return sizeInBytes;
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneStoreRAMFile getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$JC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (unint64_t)hash
{
  int length = self->length_;
  int length_high = HIDWORD(self->length_);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  buffers = self->buffers_;
  if (!buffers) {
    JreThrowNullPointerException();
  }
  int v5 = length_high ^ length;
  unint64_t v6 = [(JavaUtilArrayList *)self->buffers_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = (id)v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(buffers);
        }
        int v5 = JavaUtilArrays_hashCodeWithByteArray_(*(void *)(*((void *)&v11 + 1) + 8 * i)) - v5 + 32 * v5;
      }
      id v7 = [(JavaUtilArrayList *)buffers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  id v5 = [(OrgApacheLuceneStoreRAMFile *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->length_ != *((void *)a3 + 2)) {
    return 0;
  }
  buffers = self->buffers_;
  if (!buffers) {
    JreThrowNullPointerException();
  }
  unsigned int v7 = [(JavaUtilArrayList *)buffers size];
  if (v7 != [*((id *)a3 + 1) size]) {
    return 0;
  }
  if ([(JavaUtilArrayList *)self->buffers_ size] < 1) {
    return 1;
  }
  uint64_t v8 = 0;
  do
  {
    char v9 = JavaUtilArrays_equalsWithByteArray_withByteArray_((uint64_t)-[JavaUtilArrayList getWithInt:](self->buffers_, "getWithInt:", v8), (uint64_t)[*((id *)a3 + 1) getWithInt:v8]);
    if ((v9 & 1) == 0) {
      break;
    }
    uint64_t v8 = (v8 + 1);
  }
  while ((int)v8 < [(JavaUtilArrayList *)self->buffers_ size]);
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMFile;
  [(OrgApacheLuceneStoreRAMFile *)&v3 dealloc];
}

@end