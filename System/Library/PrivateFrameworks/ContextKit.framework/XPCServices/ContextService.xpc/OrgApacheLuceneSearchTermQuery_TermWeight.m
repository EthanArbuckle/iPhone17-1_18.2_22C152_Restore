@interface OrgApacheLuceneSearchTermQuery_TermWeight
- (BOOL)termNotInReaderWithOrgApacheLuceneIndexLeafReader:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4;
- (OrgApacheLuceneSearchTermQuery_TermWeight)initWithOrgApacheLuceneSearchTermQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneIndexTermContext:(id)a6;
- (float)getValueForNormalization;
- (id)description;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)getTermsEnumWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchTermQuery_TermWeight

- (OrgApacheLuceneSearchTermQuery_TermWeight)initWithOrgApacheLuceneSearchTermQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withOrgApacheLuceneIndexTermContext:(id)a6
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneSearchTermQuery *)self->this$0_ getTerm];
  [a3 addWithId:v4];
}

- (id)description
{
  return (id)JreStrcat("$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"weight(");
}

- (float)getValueForNormalization
{
  stats = self->stats_;
  if (!stats) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight *)stats getValueForNormalization];
  return result;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  stats = self->stats_;
  if (!stats) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight normalizeWithFloat:withFloat:](stats, "normalizeWithFloat:withFloat:");
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  id result = sub_10001E060((uint64_t)self, (unsigned int *)a3);
  if (result)
  {
    id v6 = [result postingsWithOrgApacheLuceneIndexPostingsEnum:0 withInt:8 * self->needsScores_];
    similarity = self->similarity_;
    if (!similarity) {
      JreThrowNullPointerException();
    }
    v8 = new_OrgApacheLuceneSearchTermScorer_initWithOrgApacheLuceneSearchWeight_withOrgApacheLuceneIndexPostingsEnum_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_(self, v6, [(OrgApacheLuceneSearchSimilaritiesSimilarity *)similarity simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:self->stats_ withOrgApacheLuceneIndexLeafReaderContext:a3]);
    return v8;
  }
  return result;
}

- (id)getTermsEnumWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  return sub_10001E060((uint64_t)self, (unsigned int *)a3);
}

- (BOOL)termNotInReaderWithOrgApacheLuceneIndexLeafReader:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 docFreqWithOrgApacheLuceneIndexTerm:a4] == 0;
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = -[OrgApacheLuceneSearchTermQuery_TermWeight scorerWithOrgApacheLuceneIndexLeafReaderContext:](self, "scorerWithOrgApacheLuceneIndexLeafReaderContext:");
  if (v7 && (v8 = v7, [v7 advanceWithInt:v4] == v4))
  {
    int v9 = [v8 freq];
    similarity = self->similarity_;
    if (!similarity
      || (float v11 = (float)v9,
          id v12 = -[OrgApacheLuceneSearchSimilaritiesSimilarity simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:withOrgApacheLuceneIndexLeafReaderContext:](similarity, "simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:withOrgApacheLuceneIndexLeafReaderContext:", self->stats_, a3), v20 = JreStrcat("$F", v13, v14, v15, v16, v17, v18, v19, @"termFreq="), v21 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, OrgApacheLuceneSearchExplanation_class_()), v22 = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v20, v21, v11), !v12)|| (v23 = [v12 explainWithInt:v4 withOrgApacheLuceneSearchExplanation:v22]) == 0)
    {
      JreThrowNullPointerException();
    }
    id v24 = v23;
    [v23 getValue];
    float v26 = v25;
    [(OrgApacheLuceneSearchWeight *)self getQuery];
    objc_msgSend(-[OrgApacheLuceneSearchSimilaritiesSimilarity getClass](self->similarity_, "getClass"), "getSimpleName");
    CFStringRef v34 = JreStrcat("$@$I$$$", v27, v28, v29, v30, v31, v32, v33, @"weight(");
    id v38 = v24;
    v35 = +[IOSObjectArray arrayWithObjects:&v38 count:1 type:OrgApacheLuceneSearchExplanation_class_()];
    return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v34, v35, v26);
  }
  else
  {
    v37 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_(@"no matching term", v37);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTermQuery_TermWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end