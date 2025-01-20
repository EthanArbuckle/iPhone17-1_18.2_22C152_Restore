@interface OrgApacheLuceneSearchConjunctionScorer
- (OrgApacheLuceneSearchConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5;
- (OrgApacheLuceneSearchConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5 withFloat:(float)a6;
- (float)score;
- (id)asTwoPhaseIterator;
- (id)getChildren;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConjunctionScorer

- (OrgApacheLuceneSearchConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5 withFloat:(float)a6
{
  return self;
}

- (id)asTwoPhaseIterator
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)disi asTwoPhaseIterator];
}

- (int)advanceWithInt:(int)a3
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)disi advanceWithInt:*(void *)&a3];
}

- (int)docID
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)disi docID];
}

- (int)nextDoc
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)disi nextDoc];
}

- (float)score
{
  scorers = self->scorers_;
  if (!scorers) {
LABEL_8:
  }
    JreThrowNullPointerException();
  p_elementType = (void **)&scorers->elementType_;
  unint64_t v5 = (unint64_t)&(&scorers->elementType_)[scorers->super.size_];
  double v6 = 0.0;
  if ((unint64_t)&scorers->elementType_ < v5)
  {
    double v7 = 0.0;
    do
    {
      v8 = *p_elementType;
      if (!*p_elementType) {
        goto LABEL_8;
      }
      ++p_elementType;
      objc_msgSend(v8, "score", v6);
      double v6 = v9;
      double v7 = v7 + v6;
    }
    while ((unint64_t)p_elementType < v5);
    *(float *)&double v6 = v7;
  }
  return self->coord_ * *(float *)&v6;
}

- (int)freq
{
  scorers = self->scorers_;
  if (!scorers) {
    JreThrowNullPointerException();
  }
  return scorers->super.size_;
}

- (int64_t)cost
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)disi cost];
}

- (id)getChildren
{
  v3 = new_JavaUtilArrayList_init();
  scorers = self->scorers_;
  if (!scorers) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = v3;
  p_elementType = (void **)&scorers->elementType_;
  unint64_t v7 = (unint64_t)&(&scorers->elementType_)[scorers->super.size_];
  if ((unint64_t)&scorers->elementType_ < v7)
  {
    do
    {
      v8 = *p_elementType++;
      [(JavaUtilArrayList *)v5 addWithId:new_OrgApacheLuceneSearchScorer_ChildScorer_initWithOrgApacheLuceneSearchScorer_withNSString_(v8, @"MUST")];
    }
    while ((unint64_t)p_elementType < v7);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConjunctionScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end