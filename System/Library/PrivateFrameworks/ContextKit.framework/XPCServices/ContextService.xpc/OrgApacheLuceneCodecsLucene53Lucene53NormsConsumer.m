@interface OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer
- (OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (void)addByte1WithJavaLangIterable:(id)a3;
- (void)addByte2WithJavaLangIterable:(id)a3;
- (void)addByte4WithJavaLangIterable:(id)a3;
- (void)addByte8WithJavaLangIterable:(id)a3;
- (void)addConstantWithLong:(int64_t)a3;
- (void)addNormsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer

- (OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  return self;
}

- (void)addNormsFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
  meta = self->meta_;
  if (!meta) {
    goto LABEL_28;
  }
  if (!a3) {
    goto LABEL_28;
  }
  [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:*((unsigned int *)a3 + 4)];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  if (!a4) {
    goto LABEL_28;
  }
  id v7 = [a4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7)
  {
    if (!self->maxDoc_)
    {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v19 = 0x8000000000000000;
      goto LABEL_18;
    }
    goto LABEL_31;
  }
  id v15 = v7;
  int v16 = 0;
  uint64_t v17 = *(void *)v28;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0x8000000000000000;
  do
  {
    v20 = 0;
    int v21 = v16 + v15;
    do
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(a4);
      }
      v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v20);
      if (!v22)
      {
        CFStringRef v25 = JreStrcat("$$$I", v8, v9, v10, v11, v12, v13, v14, @"illegal norms data for field ");
        goto LABEL_30;
      }
      id v23 = [v22 longLongValue];
      uint64_t v18 = JavaLangMath_minWithLong_withLong_(v18, (uint64_t)v23);
      uint64_t v19 = JavaLangMath_maxWithLong_withLong_(v19, (uint64_t)v23);
      v20 = (char *)v20 + 1;
    }
    while (v15 != v20);
    id v15 = [a4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    int v16 = v21;
  }
  while (v15);
  if (v21 != self->maxDoc_)
  {
LABEL_31:
    CFStringRef v25 = JreStrcat("$$$I$I", v8, v9, v10, v11, v12, v13, v14, @"illegal norms data for field ");
LABEL_30:
    v26 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v25);
    objc_exception_throw(v26);
  }
  if (v18 == v19)
  {
    v24 = self->meta_;
    if (v24)
    {
      [(OrgApacheLuceneStoreIndexOutput *)v24 writeByteWithByte:0];
      [(OrgApacheLuceneStoreDataOutput *)self->meta_ writeLongWithLong:v18];
      return;
    }
LABEL_28:
    JreThrowNullPointerException();
  }
LABEL_18:
  if (v18 < -128 || v19 > 127)
  {
    if (v18 < -32768 || v19 >= 0x8000)
    {
      if (v18 < (uint64_t)0xFFFFFFFF80000000 || v19 > 0x7FFFFFFF) {
        sub_10010F39C((uint64_t)self, a4);
      }
      else {
        sub_10010F24C((uint64_t)self, a4);
      }
    }
    else
    {
      sub_10010F0FC((uint64_t)self, a4);
    }
  }
  else
  {
    sub_10010EFAC((uint64_t)self, a4);
  }
}

- (void)addConstantWithLong:(int64_t)a3
{
  meta = self->meta_;
  if (!meta) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexOutput *)meta writeByteWithByte:0];
  v6 = self->meta_;
  [(OrgApacheLuceneStoreDataOutput *)v6 writeLongWithLong:a3];
}

- (void)addByte1WithJavaLangIterable:(id)a3
{
}

- (void)addByte2WithJavaLangIterable:(id)a3
{
}

- (void)addByte4WithJavaLangIterable:(id)a3
{
}

- (void)addByte8WithJavaLangIterable:(id)a3
{
}

- (void)close
{
  p_meta = (void **)&self->meta_;
  meta = self->meta_;
  if (meta)
  {
    [(OrgApacheLuceneStoreDataOutput *)meta writeVIntWithInt:0xFFFFFFFFLL];
    OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(*p_meta);
  }
  data = self->data_;
  if (data)
  {
    OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(data);
    v6 = self->data_;
  }
  else
  {
    v6 = 0;
  }
  id v7 = *p_meta;
  v10[0] = v6;
  v10[1] = v7;
  uint64_t v8 = +[IOSObjectArray arrayWithObjects:v10 count:2 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v8);
  id v9 = JreStrongAssign((id *)&self->data_, 0);
  JreStrongAssign(p_meta, v9);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer;
  [(OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer *)&v3 dealloc];
}

@end