@interface OrgApacheLuceneCodecsLucene53Lucene53NormsProducer
- (OrgApacheLuceneCodecsLucene53Lucene53NormsProducer)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (id)description;
- (id)getNormsWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
- (void)readFieldsWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfos:(id)a4;
@end

@implementation OrgApacheLuceneCodecsLucene53Lucene53NormsProducer

- (OrgApacheLuceneCodecsLucene53Lucene53NormsProducer)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  return self;
}

- (void)readFieldsWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfos:(id)a4
{
}

- (id)getNormsWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  norms = self->norms_;
  if (!norms
    || !a3
    || (v5 = [(JavaUtilMap *)norms getWithId:JavaLangInteger_valueOfWithInt_(*((_DWORD *)a3 + 4))]) == 0)
  {
    JreThrowNullPointerException();
  }
  v6 = v5;
  if (*((unsigned char *)v5 + 8))
  {
    data = self->data_;
    objc_sync_enter(data);
    switch(*((unsigned char *)v6 + 8))
    {
      case 1:
        v8 = self->data_;
        if (!v8) {
          goto LABEL_19;
        }
        id v9 = [(OrgApacheLuceneStoreIndexInput *)v8 randomAccessSliceWithLong:v6[2] withLong:self->maxDoc_];
        v10 = [OrgApacheLuceneCodecsLucene53Lucene53NormsProducer__2 alloc];
        JreStrongAssign((id *)&v10->val$slice_, v9);
        OrgApacheLuceneIndexNumericDocValues_init(v10, v11);
        break;
      case 2:
        v22 = self->data_;
        if (!v22) {
          goto LABEL_19;
        }
        id v23 = [(OrgApacheLuceneStoreIndexInput *)v22 randomAccessSliceWithLong:v6[2] withLong:2 * self->maxDoc_];
        v10 = [OrgApacheLuceneCodecsLucene53Lucene53NormsProducer__3 alloc];
        JreStrongAssign((id *)&v10->val$slice_, v23);
        OrgApacheLuceneIndexNumericDocValues_init(v10, v24);
        break;
      case 4:
        v16 = self->data_;
        if (!v16) {
          goto LABEL_19;
        }
        id v17 = [(OrgApacheLuceneStoreIndexInput *)v16 randomAccessSliceWithLong:v6[2] withLong:4 * self->maxDoc_];
        v10 = [OrgApacheLuceneCodecsLucene53Lucene53NormsProducer__4 alloc];
        JreStrongAssign((id *)&v10->val$slice_, v17);
        OrgApacheLuceneIndexNumericDocValues_init(v10, v18);
        break;
      case 8:
        v19 = self->data_;
        if (!v19) {
LABEL_19:
        }
          JreThrowNullPointerException();
        id v20 = [(OrgApacheLuceneStoreIndexInput *)v19 randomAccessSliceWithLong:v6[2] withLong:8 * self->maxDoc_];
        v10 = [OrgApacheLuceneCodecsLucene53Lucene53NormsProducer__5 alloc];
        JreStrongAssign((id *)&v10->val$slice_, v20);
        OrgApacheLuceneIndexNumericDocValues_init(v10, v21);
        break;
      default:
        v26 = new_JavaLangAssertionError_init();
        objc_exception_throw(v26);
    }
    v25 = v10;
    objc_sync_exit(data);
    return v25;
  }
  else
  {
    int64_t v12 = v5[2];
    v13 = [OrgApacheLuceneCodecsLucene53Lucene53NormsProducer__1 alloc];
    v13->val$value_ = v12;
    OrgApacheLuceneIndexNumericDocValues_init(v13, v14);
    return v13;
  }
}

- (void)close
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)data close];
}

- (int64_t)ramBytesUsed
{
  norms = self->norms_;
  if (!norms) {
    JreThrowNullPointerException();
  }
  return (uint64_t)(int)[(JavaUtilMap *)norms size] << 6;
}

- (void)checkIntegrity
{
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneCodecsLucene53Lucene53NormsProducer getClass](self, "getClass"), "getSimpleName");
  norms = self->norms_;
  if (!norms) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)norms size];
  return (id)JreStrcat("$$IC", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene53Lucene53NormsProducer;
  [(OrgApacheLuceneCodecsLucene53Lucene53NormsProducer *)&v3 dealloc];
}

@end