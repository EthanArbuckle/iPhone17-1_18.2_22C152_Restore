@interface OrgApacheLuceneSearchFieldComparator_RelevanceComparator
- (OrgApacheLuceneSearchFieldComparator_RelevanceComparator)initWithInt:(int)a3;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareValuesWithId:(id)a3 withId:(id)a4;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_RelevanceComparator

- (OrgApacheLuceneSearchFieldComparator_RelevanceComparator)initWithInt:(int)a3
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  scores = self->scores_;
  if (!scores) {
    JreThrowNullPointerException();
  }
  uint64_t size = scores->super.size_;
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  float v6 = *((float *)&scores->super.size_ + a3 + 1);
  float v7 = *((float *)&scores->super.size_ + a4 + 1);
  return JavaLangFloat_compareWithFloat_withFloat_(v7, v6);
}

- (int)compareBottomWithInt:(int)a3
{
  scorer = self->scorer_;
  if (!scorer) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchScorer *)scorer score];
  float bottom = self->bottom_;
  return JavaLangFloat_compareWithFloat_withFloat_(v5, bottom);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  scorer = self->scorer_;
  if (!scorer
    || (uint64_t v6 = *(void *)&a3,
        [(OrgApacheLuceneSearchScorer *)scorer score],
        (scores = self->scores_) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t size = scores->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)size <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  *(&scores->super.size_ + (int)v6 + 1) = v7;
}

- (void)setBottomWithInt:(int)a3
{
  scores = self->scores_;
  if (!scores) {
    JreThrowNullPointerException();
  }
  uint64_t size = scores->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  self->bottom_ = *((float *)&scores->super.size_ + a3 + 1);
}

- (void)setTopValueWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 floatValue];
  self->topValue_ = v4;
}

- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3
{
  objc_opt_class();
  p_scorer = &self->scorer_;
  if (objc_opt_isKindOfClass())
  {
    JreStrongAssign((id *)p_scorer, a3);
  }
  else
  {
    uint64_t v6 = new_OrgApacheLuceneSearchScoreCachingWrappingScorer_initWithOrgApacheLuceneSearchScorer_((void **)a3);
    JreStrongAssignAndConsume((id *)p_scorer, v6);
  }
}

- (id)valueWithInt:(int)a3
{
  scores = self->scores_;
  if (!scores) {
    JreThrowNullPointerException();
  }
  uint64_t size = scores->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  float v5 = *((float *)&scores->super.size_ + a3 + 1);
  return JavaLangFloat_valueOfWithFloat_(v5);
}

- (int)compareValuesWithId:(id)a3 withId:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  return [a4 compareToWithId:a3];
}

- (int)compareTopWithInt:(int)a3
{
  scorer = self->scorer_;
  if (!scorer) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchScorer *)scorer score];
  float topValue = self->topValue_;
  return JavaLangFloat_compareWithFloat_withFloat_(v5, topValue);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_RelevanceComparator;
  [(OrgApacheLuceneSearchFieldComparator_RelevanceComparator *)&v3 dealloc];
}

@end