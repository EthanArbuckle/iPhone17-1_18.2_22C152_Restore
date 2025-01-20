@interface OrgApacheLuceneUtilBitSet
+ (id)ofWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withInt:(int)a4;
- (void)andNotWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)leapFrogWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withOrgApacheLuceneUtilBitSet_LeapFrogCallBack:(id)a4;
- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
@end

@implementation OrgApacheLuceneUtilBitSet

+ (id)ofWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilBitSet_ofWithOrgApacheLuceneSearchDocIdSetIterator_withInt_(a3, a4);
}

- (void)assertUnpositionedWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
}

- (void)or__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  sub_100076050(a3);
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 nextDoc];
  if (v5 != 0x7FFFFFFF)
  {
    id v6 = v5;
    do
    {
      [(OrgApacheLuceneUtilBitSet *)self setWithInt:v6];
      id v6 = [a3 nextDoc];
    }
    while (v6 != 0x7FFFFFFF);
  }
}

- (void)leapFrogWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withOrgApacheLuceneUtilBitSet_LeapFrogCallBack:(id)a4
{
}

- (void)and__WithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  sub_100076050(a3);
  id v5 = [OrgApacheLuceneUtilBitSet__1 alloc];
  JreStrongAssign((id *)&v5->this$0_, self);
  v5->previous_ = -1;
  id v6 = v5;
  sub_100076134(self, a3, v6);
}

- (void)andNotWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  sub_100076050(a3);
  id v5 = [OrgApacheLuceneUtilBitSet__2 alloc];
  JreStrongAssign((id *)&v5->this$0_, self);
  id v6 = v5;
  sub_100076134(self, a3, v6);
}

@end