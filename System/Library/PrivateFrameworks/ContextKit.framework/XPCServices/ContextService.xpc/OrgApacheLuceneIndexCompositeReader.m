@interface OrgApacheLuceneIndexCompositeReader
- (OrgApacheLuceneIndexCompositeReader)init;
- (id)description;
- (id)getContext;
@end

@implementation OrgApacheLuceneIndexCompositeReader

- (OrgApacheLuceneIndexCompositeReader)init
{
  return self;
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  id v4 = [(OrgApacheLuceneIndexCompositeReader *)self getClass];
  if (v4)
  {
    id v5 = v4;
    while (([v5 isAnonymousClass] & 1) != 0)
    {
      id v5 = [v5 getSuperclass];
      if (!v5) {
        goto LABEL_7;
      }
    }
    -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v5 getSimpleName]);
  }
LABEL_7:
  [(JavaLangStringBuilder *)v3 appendWithChar:40];
  id v6 = [(OrgApacheLuceneIndexCompositeReader *)self getSequentialSubReaders];
  if (!v6) {
LABEL_16:
  }
    JreThrowNullPointerException();
  v7 = v6;
  if (([v6 isEmpty] & 1) == 0)
  {
    -[JavaLangStringBuilder appendWithId:](v3, "appendWithId:", [v7 getWithInt:0]);
    int v8 = [v7 size];
    if (v8 >= 2)
    {
      int v9 = v8;
      uint64_t v10 = 1;
      do
      {
        id v11 = [(JavaLangStringBuilder *)v3 appendWithNSString:@" "];
        if (!v11) {
          goto LABEL_16;
        }
        objc_msgSend(v11, "appendWithId:", objc_msgSend(v7, "getWithInt:", v10));
        uint64_t v10 = (v10 + 1);
      }
      while (v9 != v10);
    }
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:41];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)getContext
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  p_readerContext = (unint64_t *)&self->readerContext_;
  if (!atomic_load((unint64_t *)&self->readerContext_)) {
    atomic_store((unint64_t)OrgApacheLuceneIndexCompositeReaderContext_createWithOrgApacheLuceneIndexCompositeReader_(self), p_readerContext);
  }
  return (id)atomic_load(p_readerContext);
}

@end