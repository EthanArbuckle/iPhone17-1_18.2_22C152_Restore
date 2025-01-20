@interface OrgApacheLuceneCodecsBlockTermState
- (BOOL)isRealTerm;
- (OrgApacheLuceneCodecsBlockTermState)init;
- (id)description;
- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsBlockTermState

- (OrgApacheLuceneCodecsBlockTermState)init
{
  self->isRealTerm_ = 1;
  return self;
}

- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3
{
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneCodecsBlockTermState;
  [(OrgApacheLuceneIndexOrdTermState *)&v5 copyFromWithOrgApacheLuceneIndexTermState:a3];
  self->docFreq_ = *((_DWORD *)a3 + 4);
  self->totalTermFreq_ = *((void *)a3 + 3);
  self->termBlockOrd_ = *((_DWORD *)a3 + 8);
  self->blockFilePointer_ = *((void *)a3 + 5);
  self->isRealTerm_ = *((unsigned char *)a3 + 48);
}

- (BOOL)isRealTerm
{
  return self->isRealTerm_;
}

- (id)description
{
  return (id)JreStrcat("$I$J$I$J$Z", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"docFreq=");
}

@end