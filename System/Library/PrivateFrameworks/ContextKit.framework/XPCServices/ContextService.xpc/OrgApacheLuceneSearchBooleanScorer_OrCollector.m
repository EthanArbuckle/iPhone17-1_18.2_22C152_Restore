@interface OrgApacheLuceneSearchBooleanScorer_OrCollector
- (OrgApacheLuceneSearchBooleanScorer_OrCollector)initWithOrgApacheLuceneSearchBooleanScorer:(id)a3;
- (void)__javaClone;
- (void)collectWithInt:(int)a3;
- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3;
@end

@implementation OrgApacheLuceneSearchBooleanScorer_OrCollector

- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3
{
}

- (void)collectWithInt:(int)a3
{
  v5 = &self->this$0_;
  uint64_t v6 = *(objc_loadWeak((id *)&self->this$0_) + 2);
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = a3 & 0x7FF;
  uint64_t v8 = (a3 >> 6) & 0x1F;
  uint64_t v9 = *(unsigned int *)(v6 + 8);
  if ((int)v8 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v8);
  }
  *(void *)(v6 + 16 + 8 * v8) |= 1 << v7;
  uint64_t v10 = *(objc_loadWeak((id *)v5) + 1);
  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = *(unsigned int *)(v10 + 8);
  if ((int)v7 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v7);
  }
  uint64_t v12 = *(void *)(v10 + 24 + 8 * v7);
  if (!v12 || (++*(_DWORD *)(v12 + 16), (id Weak = objc_loadWeak((id *)&self->scorer_)) == 0)) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [Weak score];
  *(double *)(v12 + 8) = *(double *)(v12 + 8) + v14;
}

- (OrgApacheLuceneSearchBooleanScorer_OrCollector)initWithOrgApacheLuceneSearchBooleanScorer:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanScorer_OrCollector;
  [(OrgApacheLuceneSearchBooleanScorer_OrCollector *)&v3 __javaClone];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->this$0_);
  objc_destroyWeak((id *)&self->scorer_);
}

@end