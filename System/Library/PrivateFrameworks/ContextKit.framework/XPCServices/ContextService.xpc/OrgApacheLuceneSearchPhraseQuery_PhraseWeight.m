@interface OrgApacheLuceneSearchPhraseQuery_PhraseWeight
- (BOOL)termNotInReaderWithOrgApacheLuceneIndexLeafReader:(id)a3 withOrgApacheLuceneIndexTerm:(id)a4;
- (OrgApacheLuceneSearchPhraseQuery_PhraseWeight)initWithOrgApacheLuceneSearchPhraseQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5;
- (float)getValueForNormalization;
- (id)description;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchPhraseQuery_PhraseWeight

- (OrgApacheLuceneSearchPhraseQuery_PhraseWeight)initWithOrgApacheLuceneSearchPhraseQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
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
  if (!a3) {
    goto LABEL_29;
  }
  id v5 = [a3 reader];
  uint64_t v6 = &OBJC_IVAR___IOSArray_size_;
  uint64_t size = self->terms_->super.size_;
  if (qword_1005601F0 != -1) {
    dispatch_once(&qword_1005601F0, &stru_1003F1E50);
  }
  v40 = +[IOSObjectArray arrayWithLength:size type:qword_1005601E8];
  if (!v5) {
    goto LABEL_29;
  }
  id result = [v5 termsWithNSString:*(void *)&self->this$0_->slop_];
  if (result)
  {
    id v9 = result;
    if (([result hasPositions] & 1) == 0)
    {
      [(OrgApacheLuceneSearchWeight *)self getQuery];
      CFStringRef v38 = JreStrcat("$$$@C", v31, v32, v33, v34, v35, v36, v37, @"field \"");
      v39 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v38);
      objc_exception_throw(v39);
    }
    id v10 = [v9 iterator];
    terms = self->terms_;
    LODWORD(v12) = 8;
    if (terms->super.size_ >= 1)
    {
      v13 = v10;
      uint64_t v14 = 0;
      while (1)
      {
        states = self->states_;
        if (!states) {
          break;
        }
        v16 = (&terms->elementType_)[v14];
        uint64_t v17 = *(int *)((char *)&states->super.super.isa + (int)v12);
        if (v14 >= v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v14);
        }
        v18 = (&states->elementType_)[v14];
        if (!v18) {
          break;
        }
        id result = [(IOSClass *)v18 getWithInt:*((unsigned int *)a3 + 7)];
        if (!result) {
          return result;
        }
        if (!v13) {
          break;
        }
        if (!v16) {
          break;
        }
        objc_msgSend(v13, "seekExactWithOrgApacheLuceneUtilBytesRef:withOrgApacheLuceneIndexTermState:", -[IOSClass bytes](v16, "bytes"), result);
        id v19 = [v13 postingsWithOrgApacheLuceneIndexPostingsEnum:0 withInt:24];
        positions = self->positions_;
        if (!positions) {
          break;
        }
        v21 = v19;
        uint64_t v22 = *(int *)((char *)&positions->super.super.isa + *v6);
        v23 = v6;
        if (v14 >= v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, v14);
        }
        int v24 = *(&positions->super.size_ + v14 + 1);
        v41 = v16;
        v25 = +[IOSObjectArray arrayWithObjects:&v41 count:1 type:OrgApacheLuceneIndexTerm_class_()];
        v26 = [OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq alloc];
        OrgApacheLuceneSearchPhraseQuery_PostingsAndFreq_initWithOrgApacheLuceneIndexPostingsEnum_withInt_withOrgApacheLuceneIndexTermArray_((uint64_t)v26, v21, v24, v25);
        IOSObjectArray_SetAndConsume((uint64_t)v40, v14++, v26);
        terms = self->terms_;
        uint64_t v12 = *v23;
        uint64_t v6 = v23;
        if (v14 >= *(int *)((char *)&terms->super.super.isa + v12)) {
          goto LABEL_21;
        }
      }
LABEL_29:
      JreThrowNullPointerException();
    }
LABEL_21:
    int v27 = *(_DWORD *)&self->this$0_->mutable__;
    if (v27
      || (OrgApacheLuceneUtilArrayUtil_timSortWithJavaLangComparableArray_(v40),
          (int v27 = *(_DWORD *)&self->this$0_->mutable__) != 0))
    {
      similarity = self->similarity_;
      if (!similarity) {
        goto LABEL_29;
      }
      PostingsAndFreqArray_withInt_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_withBoolean = new_OrgApacheLuceneSearchSloppyPhraseScorer_initWithOrgApacheLuceneSearchWeight_withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray_withInt_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_withBoolean_(self, (uint64_t)v40, v27, [(OrgApacheLuceneSearchSimilaritiesSimilarity *)similarity simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:self->stats_ withOrgApacheLuceneIndexLeafReaderContext:a3], self->needsScores_);
    }
    else
    {
      v30 = self->similarity_;
      if (!v30) {
        goto LABEL_29;
      }
      PostingsAndFreqArray_withInt_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_withBoolean = new_OrgApacheLuceneSearchExactPhraseScorer_initWithOrgApacheLuceneSearchWeight_withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_withBoolean_(self, (uint64_t)v40, [(OrgApacheLuceneSearchSimilaritiesSimilarity *)v30 simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:self->stats_ withOrgApacheLuceneIndexLeafReaderContext:a3], self->needsScores_);
    }
    return PostingsAndFreqArray_withInt_withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer_withBoolean;
  }
  return result;
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
  id v7 = -[OrgApacheLuceneSearchPhraseQuery_PhraseWeight scorerWithOrgApacheLuceneIndexLeafReaderContext:](self, "scorerWithOrgApacheLuceneIndexLeafReaderContext:");
  if (v7 && (v8 = v7, [v7 advanceWithInt:v4] == v4))
  {
    if (*(_DWORD *)&self->this$0_->mutable__)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      [v8 sloppyFreq];
      float v10 = v9;
    }
    else
    {
      float v10 = (float)(int)[v8 freq];
    }
    similarity = self->similarity_;
    if (!similarity
      || (id v14 = -[OrgApacheLuceneSearchSimilaritiesSimilarity simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:withOrgApacheLuceneIndexLeafReaderContext:](similarity, "simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:withOrgApacheLuceneIndexLeafReaderContext:", self->stats_, a3), v22 = JreStrcat("$F", v15, v16, v17, v18, v19, v20, v21, @"phraseFreq="), v23 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, OrgApacheLuceneSearchExplanation_class_()), v24 = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v22, v23, v10), !v14)|| (v25 = [v14 explainWithInt:v4 withOrgApacheLuceneSearchExplanation:v24]) == 0)
    {
      JreThrowNullPointerException();
    }
    id v26 = v25;
    [v25 getValue];
    float v28 = v27;
    [(OrgApacheLuceneSearchWeight *)self getQuery];
    objc_msgSend(-[OrgApacheLuceneSearchSimilaritiesSimilarity getClass](self->similarity_, "getClass"), "getSimpleName");
    CFStringRef v36 = JreStrcat("$@$I$$$", v29, v30, v31, v32, v33, v34, v35, @"weight(");
    id v38 = v26;
    uint64_t v37 = +[IOSObjectArray arrayWithObjects:&v38 count:1 type:OrgApacheLuceneSearchExplanation_class_()];
    return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v36, v37, v28);
  }
  else
  {
    v11 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_(@"no matching term", v11);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchPhraseQuery_PhraseWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end