@interface OrgApacheLuceneStoreRAMInputStream_$1
- (OrgApacheLuceneStoreRAMInputStream_$1)initWithLong:(int64_t)a3 withNSString:(id)a4 withOrgApacheLuceneStoreRAMFile:(id)a5 withLong:(int64_t)a6;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)getFilePointer;
- (int64_t)length;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreRAMInputStream_$1

- (void)seekWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v9 = JreStrcat("$@", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"Seeking to negative position: ");
    v10 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  int64_t v8 = *(void *)(&self->super.bufferLength_ + 1) + a3;
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneStoreRAMInputStream__1;
  [(OrgApacheLuceneStoreRAMInputStream *)&v11 seekWithLong:v8];
}

- (int64_t)getFilePointer
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMInputStream__1;
  return [(OrgApacheLuceneStoreRAMInputStream *)&v3 getFilePointer]
       - *(void *)(&self->super.bufferLength_ + 1);
}

- (int64_t)length
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMInputStream__1;
  return [(OrgApacheLuceneStoreRAMInputStream *)&v3 length] - *(void *)(&self->super.bufferLength_ + 1);
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  int64_t v5 = *(void *)(&self->super.bufferLength_ + 1) + a4;
  v7.receiver = self;
  v7.super_class = (Class)OrgApacheLuceneStoreRAMInputStream__1;
  return [(OrgApacheLuceneStoreRAMInputStream *)&v7 sliceWithNSString:a3 withLong:v5 withLong:a5];
}

- (OrgApacheLuceneStoreRAMInputStream_$1)initWithLong:(int64_t)a3 withNSString:(id)a4 withOrgApacheLuceneStoreRAMFile:(id)a5 withLong:(int64_t)a6
{
  *(void *)(&self->super.bufferLength_ + 1) = a3;
  OrgApacheLuceneStoreRAMInputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withLong_((uint64_t)self, (uint64_t)a4, a5, a6, (uint64_t)a5, a6, v6, v7);
  [(OrgApacheLuceneStoreRAMInputStream_$1 *)self seekWithLong:0];
  return self;
}

@end