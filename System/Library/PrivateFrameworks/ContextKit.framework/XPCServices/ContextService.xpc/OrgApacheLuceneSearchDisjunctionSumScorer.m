@interface OrgApacheLuceneSearchDisjunctionSumScorer
- (OrgApacheLuceneSearchDisjunctionSumScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withFloatArray:(id)a5 withBoolean:(BOOL)a6;
- (float)scoreWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchDisjunctionSumScorer

- (OrgApacheLuceneSearchDisjunctionSumScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withFloatArray:(id)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (float)scoreWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
  if (a3)
  {
    v4 = a3;
    LODWORD(v5) = 0;
    double v6 = 0.0;
    do
    {
      v7 = (void *)v4[1];
      if (!v7) {
        goto LABEL_11;
      }
      [v7 score];
      double v6 = v6 + v8;
      uint64_t v5 = (v5 + 1);
      v4 = (void *)v4[4];
    }
    while (v4);
    float v9 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    float v9 = 0.0;
  }
  coord = self->coord_;
  if (!coord) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t size = coord->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return *((float *)&coord->super.size_ + (int)v5 + 1) * v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionSumScorer;
  [(OrgApacheLuceneSearchDisjunctionScorer *)&v3 dealloc];
}

@end