@interface OrgApacheLuceneSearchConstantScoreWeight
- (OrgApacheLuceneSearchConstantScoreWeight)initWithOrgApacheLuceneSearchQuery:(id)a3;
- (float)getValueForNormalization;
- (float)score;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchConstantScoreWeight

- (OrgApacheLuceneSearchConstantScoreWeight)initWithOrgApacheLuceneSearchQuery:(id)a3
{
  return self;
}

- (float)getValueForNormalization
{
  return self->queryWeight_ * self->queryWeight_;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  float v4 = a3 * a4;
  self->queryNorm_ = v4;
  self->queryWeight_ = v4 * self->queryWeight_;
}

- (float)score
{
  return self->queryWeight_;
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(OrgApacheLuceneSearchConstantScoreWeight *)self scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = v6;
  id v8 = [v6 asTwoPhaseIterator];
  if (!v8)
  {
    if ([v7 advanceWithInt:v4] != v4) {
      goto LABEL_6;
    }
LABEL_11:
    float queryWeight = self->queryWeight_;
    id v24 = [(OrgApacheLuceneSearchWeight *)self getQuery];
    if (v24)
    {
      id v25 = [v24 description];
      CFStringRef v33 = JreStrcat("$$", v26, v27, v28, v29, v30, v31, v32, v25);
      id v34 = [(OrgApacheLuceneSearchWeight *)self getQuery];
      if (v34)
      {
        [v34 getBoost];
        float v36 = v35;
        v37 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
        v41[0] = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_(@"boost", v37, v36);
        float queryNorm = self->queryNorm_;
        v39 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
        v41[1] = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_(@"queryNorm", v39, queryNorm);
        v40 = +[IOSObjectArray arrayWithObjects:v41 count:2 type:OrgApacheLuceneSearchExplanation_class_()];
        return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v33, v40, queryWeight);
      }
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  v9 = v8;
  id v10 = [v8 approximation];
  if (!v10) {
    goto LABEL_14;
  }
  if ([v10 advanceWithInt:v4] == v4 && objc_msgSend(v9, "matches")) {
    goto LABEL_11;
  }
LABEL_6:
  id v11 = [(OrgApacheLuceneSearchWeight *)self getQuery];
  if (!v11) {
    goto LABEL_14;
  }
  id v12 = [v11 description];
  CFStringRef v20 = JreStrcat("$$I", v13, v14, v15, v16, v17, v18, v19, v12);
  v21 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
  return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v20, v21);
}

@end