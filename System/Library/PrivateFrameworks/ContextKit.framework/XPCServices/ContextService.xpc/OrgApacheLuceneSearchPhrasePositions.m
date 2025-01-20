@interface OrgApacheLuceneSearchPhrasePositions
- (BOOL)nextPosition;
- (OrgApacheLuceneSearchPhrasePositions)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneIndexTermArray:(id)a6;
- (id)description;
- (void)dealloc;
- (void)firstPosition;
@end

@implementation OrgApacheLuceneSearchPhrasePositions

- (OrgApacheLuceneSearchPhrasePositions)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneIndexTermArray:(id)a6
{
  self->rptGroup_ = -1;
  JreStrongAssign((id *)&self->postings_, a3);
  self->offset_ = a4;
  self->ord_ = a5;
  JreStrongAssign((id *)&self->terms_, a6);
  return self;
}

- (void)firstPosition
{
  postings = self->postings_;
  if (!postings) {
    goto LABEL_6;
  }
  int v4 = [(OrgApacheLuceneIndexPostingsEnum *)postings freq];
  self->count_ = v4 - 1;
  if (v4 < 1) {
    return;
  }
  v5 = self->postings_;
  if (!v5) {
LABEL_6:
  }
    JreThrowNullPointerException();
  self->position_ = [(OrgApacheLuceneIndexPostingsEnum *)v5 nextPosition] - self->offset_;
}

- (BOOL)nextPosition
{
  int count = self->count_;
  self->count_ = count - 1;
  if (count >= 1)
  {
    postings = self->postings_;
    if (!postings) {
      JreThrowNullPointerException();
    }
    self->position_ = [(OrgApacheLuceneIndexPostingsEnum *)postings nextPosition]
                    - self->offset_;
  }
  return count > 0;
}

- (id)description
{
  id result = (id)JreStrcat("$I$I$I", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"o:");
  v16 = (__CFString *)result;
  if ((self->rptGroup_ & 0x80000000) == 0)
  {
    JreStrAppend(&v16, "$I$I", v10, v11, v12, v13, v14, v15, @" rpt:");
    return v16;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchPhrasePositions;
  [(OrgApacheLuceneSearchPhrasePositions *)&v3 dealloc];
}

@end