@interface OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex
+ (void)initialize;
- (OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex

- (OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withInt:(int)a4
{
  self->subIndex_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex;
  [(OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_class_()];
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex_EMPTY_ARRAY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexMultiTermsEnum_TermsEnumIndex__initialized);
  }
}

@end