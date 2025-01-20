@interface OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState)init;
- (id)clone;
- (id)description;
- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState

- (id)clone
{
  v3 = new_OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState_init();
  [(OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState *)v3 copyFromWithOrgApacheLuceneIndexTermState:self];
  return v3;
}

- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState;
  -[OrgApacheLuceneCodecsBlockTermState copyFromWithOrgApacheLuceneIndexTermState:](&v5, "copyFromWithOrgApacheLuceneIndexTermState:");
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  self->docStartFP_ = *((void *)a3 + 7);
  self->posStartFP_ = *((void *)a3 + 8);
  self->payStartFP_ = *((void *)a3 + 9);
  self->lastPosBlockOffset_ = *((void *)a3 + 11);
  self->skipOffset_ = *((void *)a3 + 10);
  self->singletonDocID_ = *((_DWORD *)a3 + 24);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState;
  id v2 = [(OrgApacheLuceneCodecsBlockTermState *)&v11 description];
  return (id)JreStrcat("$$J$J$J$J$I", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly_IntBlockTermState)init
{
  self->docStartFP_ = 0;
  self->posStartFP_ = 0;
  self->payStartFP_ = 0;
  self->skipOffset_ = -1;
  self->lastPosBlockOffset_ = -1;
  self->singletonDocID_ = -1;
  return self;
}

@end