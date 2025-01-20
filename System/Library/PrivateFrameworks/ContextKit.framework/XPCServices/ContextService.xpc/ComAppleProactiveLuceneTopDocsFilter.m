@interface ComAppleProactiveLuceneTopDocsFilter
- (ComAppleProactiveLuceneTopDocsFilter)initWithOrgApacheLuceneSearchTopDocs:(id)a3;
- (id)getDocIdSetWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withOrgApacheLuceneUtilBits:(id)a4;
- (id)toStringWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation ComAppleProactiveLuceneTopDocsFilter

- (ComAppleProactiveLuceneTopDocsFilter)initWithOrgApacheLuceneSearchTopDocs:(id)a3
{
  return self;
}

- (id)toStringWithNSString:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ComAppleProactiveLuceneTopDocsFilter;
  return [(OrgApacheLuceneSearchQuery *)&v4 description];
}

- (id)getDocIdSetWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  v7 = new_ComAppleProactiveOrgApacheLuceneUtilOpenBitSet_init();
  if (!a3) {
    goto LABEL_21;
  }
  v8 = v7;
  int v9 = *((_DWORD *)a3 + 8);
  if (a4)
  {
    unsigned int v10 = [a4 length];
  }
  else
  {
    id v11 = [a3 reader];
    if (!v11) {
      goto LABEL_21;
    }
    unsigned int v10 = [v11 maxDoc];
  }
  uint64_t v12 = *(void *)(&self->super.super.boost_ + 1);
  if (!v12) {
LABEL_21:
  }
    JreThrowNullPointerException();
  v13 = (uint64_t *)(v12 + 24);
  unint64_t v14 = v12 + 24 + 8 * *(int *)(v12 + 8);
  if (v12 + 24 >= v14) {
    return 0;
  }
  char v15 = 0;
  int v16 = v10 + v9;
  do
  {
    uint64_t v18 = *v13++;
    uint64_t v17 = v18;
    if (!v18) {
      goto LABEL_21;
    }
    int v19 = *(_DWORD *)(v17 + 12);
    if (v19 >= v9 && v19 < v16)
    {
      [(ComAppleProactiveOrgApacheLuceneUtilOpenBitSet *)v8 setWithLong:v19 - v9];
      char v15 = 1;
    }
  }
  while ((unint64_t)v13 < v14);
  if (v15) {
    return v8;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneTopDocsFilter;
  [(ComAppleProactiveLuceneTopDocsFilter *)&v3 dealloc];
}

@end