@interface OrgApacheLuceneSearchBooleanWeight
- (OrgApacheLuceneSearchBooleanWeight)initWithOrgApacheLuceneSearchBooleanQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
- (float)coordWithInt:(int)a3 withInt:(int)a4;
- (float)getValueForNormalization;
- (id)BOOLeanScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)exclWithOrgApacheLuceneSearchScorer:(id)a3 withJavaUtilList:(id)a4;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)optWithJavaUtilList:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (id)reqWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4 withBoolean:(BOOL)a5;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchBooleanWeight

- (OrgApacheLuceneSearchBooleanWeight)initWithOrgApacheLuceneSearchBooleanQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  query = self->query_;
  if (!query) {
LABEL_17:
  }
    JreThrowNullPointerException();
  unint64_t v6 = [(OrgApacheLuceneSearchBooleanQuery *)self->query_ countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = (id)v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(query);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v11) {
          goto LABEL_17;
        }
        if ((objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isScoring", (void)v14) & 1) != 0
          || !self->needsScores_ && ([v11 isProhibited] & 1) == 0)
        {
          weights = self->weights_;
          if (!weights) {
            goto LABEL_17;
          }
          id v13 = [(JavaUtilArrayList *)weights getWithInt:(char *)i + v8];
          if (!v13) {
            goto LABEL_17;
          }
          [v13 extractTermsWithJavaUtilSet:a3];
        }
      }
      id v7 = [(OrgApacheLuceneSearchBooleanQuery *)query countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = (v8 + i);
    }
    while (v7);
  }
}

- (float)getValueForNormalization
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  query = self->query_;
  if (!query) {
LABEL_16:
  }
    JreThrowNullPointerException();
  unint64_t v4 = [(OrgApacheLuceneSearchBooleanQuery *)self->query_ countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = (id)v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v21;
    float v8 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(query);
        }
        weights = self->weights_;
        if (!weights) {
          goto LABEL_16;
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = -[JavaUtilArrayList getWithInt:](weights, "getWithInt:", (char *)i + v6, (void)v20);
        if (!v12) {
          goto LABEL_16;
        }
        [v12 getValueForNormalization];
        if (!v11) {
          goto LABEL_16;
        }
        float v14 = v13;
        if ([v11 isScoring]) {
          float v15 = v14;
        }
        else {
          float v15 = -0.0;
        }
        float v8 = v8 + v15;
      }
      id v5 = [(OrgApacheLuceneSearchBooleanQuery *)query countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v6 = (v6 + i);
    }
    while (v5);
  }
  else
  {
    float v8 = 0.0;
  }
  [(OrgApacheLuceneSearchQuery *)self->query_ getBoost];
  float v17 = v16;
  [(OrgApacheLuceneSearchQuery *)self->query_ getBoost];
  return v8 * (float)(v17 * v18);
}

- (float)coordWithInt:(int)a3 withInt:(int)a4
{
  if (a3)
  {
    LODWORD(v4) = 1.0;
    if (a4 != 1)
    {
      similarity = self->similarity_;
      if (!similarity) {
        JreThrowNullPointerException();
      }
      -[OrgApacheLuceneSearchSimilaritiesSimilarity coordWithInt:withInt:](similarity, "coordWithInt:withInt:", v4);
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return *(float *)&v4;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  query = self->query_;
  if (!query
    || ([(OrgApacheLuceneSearchQuery *)query getBoost],
        float v9 = v8,
        long long v19 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        long long v22 = 0u,
        (weights = self->weights_) == 0))
  {
LABEL_12:
    JreThrowNullPointerException();
  }
  id v11 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v14 = v11;
    float v15 = v9 * a4;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(weights);
        }
        float v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (!v18) {
          goto LABEL_12;
        }
        *(float *)&double v12 = a3;
        *(float *)&double v13 = v15;
        objc_msgSend(v18, "normalizeWithFloat:withFloat:", v12, v13, (void)v19);
      }
      id v14 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  query = self->query_;
  if (!query) {
    goto LABEL_43;
  }
  unsigned int v7 = [(OrgApacheLuceneSearchBooleanQuery *)query getMinimumNumberShouldMatch];
  v88 = new_JavaUtilArrayList_init();
  id v8 = [(OrgApacheLuceneSearchBooleanQuery *)self->query_ iterator];
  weights = self->weights_;
  if (!weights) {
    goto LABEL_43;
  }
  id v10 = [(JavaUtilArrayList *)weights iterator];
  if (!v10) {
    goto LABEL_43;
  }
  id v11 = v10;
  v83 = self;
  signed int v84 = v7;
  if ([v10 hasNext])
  {
    uint64_t v87 = 0;
    uint64_t v19 = 0;
    int v20 = 0;
    signed int v21 = 0;
    float v22 = 0.0;
    uint64_t v23 = a4;
    while (1)
    {
      id v24 = [v11 next];
      if (!v8) {
        break;
      }
      v25 = v24;
      id v26 = [v8 next];
      if (!v25) {
        break;
      }
      v27 = v26;
      id v28 = [v25 explainWithOrgApacheLuceneIndexLeafReaderContext:a3 withInt:v23];
      if (!v28) {
        break;
      }
      v29 = v28;
      if ([v28 isMatch])
      {
        if (!v27) {
          break;
        }
        if ([v27 isScoring])
        {
          [(JavaUtilArrayList *)v88 addWithId:v29];
          [v29 getValue];
          float v22 = v22 + v30;
          uint64_t v87 = (v87 + 1);
        }
        else if ([v27 isRequired])
        {
          int v85 = v20;
          signed int v48 = v21;
          id v49 = a3;
          uint64_t v50 = v19;
          if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
            objc_opt_class();
          }
          CFStringRef v51 = JreStrcat("@$", v41, v42, v43, v44, v45, v46, v47, (id)qword_100563A20);
          v52 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
          v92[0] = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v51, v52, 0.0);
          v92[1] = v29;
          v53 = +[IOSObjectArray arrayWithObjects:v92 count:2 type:OrgApacheLuceneSearchExplanation_class_()];
          [(JavaUtilArrayList *)v88 addWithId:OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_(@"match on required clause, product of:", v53, 0.0)];
          uint64_t v19 = v50;
          a3 = v49;
          signed int v21 = v48;
          int v20 = v85;
          uint64_t v23 = a4;
        }
        else if ([v27 isProhibited])
        {
          id v54 = [v27 getQuery];
          if (!v54) {
            break;
          }
          [v54 description];
          CFStringRef v62 = JreStrcat("$$C", v55, v56, v57, v58, v59, v60, v61, @"match on prohibited clause (");
          v91 = v29;
          uint64_t v23 = a4;
          v63 = +[IOSObjectArray arrayWithObjects:&v91 count:1 type:OrgApacheLuceneSearchExplanation_class_()];
          uint64_t v64 = (uint64_t)v62;
          uint64_t v19 = 1;
          [(JavaUtilArrayList *)v88 addWithId:OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_(v64, v63)];
        }
        unsigned int v65 = [v27 isProhibited];
        id v66 = [v27 getOccur];
        if ((atomic_load_explicit(OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        v20 += v65 ^ 1;
        if (v66 == (id)qword_100563A28) {
          ++v21;
        }
      }
      else
      {
        if (!v27) {
          break;
        }
        if ([v27 isRequired])
        {
          id v31 = [v27 getQuery];
          if (!v31) {
            break;
          }
          [v31 description];
          CFStringRef v39 = JreStrcat("$$C", v32, v33, v34, v35, v36, v37, v38, @"no match on required clause (");
          v90 = v29;
          uint64_t v23 = a4;
          v40 = +[IOSObjectArray arrayWithObjects:&v90 count:1 type:OrgApacheLuceneSearchExplanation_class_()];
          [(JavaUtilArrayList *)v88 addWithId:OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v39, v40)];
          uint64_t v19 = 1;
        }
      }
      if (([v11 hasNext] & 1) == 0) {
        goto LABEL_31;
      }
    }
LABEL_43:
    JreThrowNullPointerException();
  }
  signed int v21 = 0;
  int v20 = 0;
  LOBYTE(v19) = 0;
  uint64_t v87 = 0;
  float v22 = 0.0;
LABEL_31:
  if (v19)
  {
    CFStringRef v67 = @"Failure to meet condition(s) of required/prohibited clause(s)";
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withJavaUtilCollection_((uint64_t)v67, v88);
  }
  if (!v20)
  {
    CFStringRef v67 = @"No matching clauses";
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withJavaUtilCollection_((uint64_t)v67, v88);
  }
  if (v21 < v84)
  {
    CFStringRef v67 = JreStrcat("$I", v12, v13, v14, v15, v16, v17, v18, @"Failure to match minimum number of optional clauses: ");
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withJavaUtilCollection_((uint64_t)v67, v88);
  }
  v69 = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withJavaUtilCollection_(@"sum of:", v88, v22);
  if (!v83->disableCoord_)
  {
    [(OrgApacheLuceneSearchBooleanWeight *)v83 coordWithInt:v87 withInt:v83->maxCoord_];
    float v79 = v78;
    if (v78 != 1.0)
    {
      v89[0] = v69;
      CFStringRef v80 = JreStrcat("$ICIC", v71, v72, v73, v74, v75, v76, v77, @"coord(");
      v81 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
      v89[1] = OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v80, v81, v79);
      v82 = +[IOSObjectArray arrayWithObjects:v89 count:2 type:OrgApacheLuceneSearchExplanation_class_()];
      return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_(@"product of:", v82, v22 * v79);
    }
  }
  return v69;
}

- (id)BOOLeanScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  uint64_t bulkScorerSize = self->bulkScorerSize_;
  if (!bulkScorerSize) {
    return 0;
  }
  uint64_t v6 = new_JavaUtilArrayList_initWithInt_(bulkScorerSize);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  weights = self->weights_;
  if (!weights) {
    goto LABEL_20;
  }
  id v8 = v6;
  unint64_t v9 = [(JavaUtilArrayList *)self->weights_ countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = (id)v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(weights);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (!v13) {
          goto LABEL_20;
        }
        id v14 = objc_msgSend(v13, "bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:", a3, (void)v23);
        if (v14) {
          [(JavaUtilArrayList *)v8 addWithId:v14];
        }
      }
      id v10 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  unsigned int v15 = [(JavaUtilArrayList *)v8 size];
  if (!v15) {
    return 0;
  }
  int v16 = v15;
  query = self->query_;
  if (!query) {
LABEL_20:
  }
    JreThrowNullPointerException();
  if ([(OrgApacheLuceneSearchBooleanQuery *)query getMinimumNumberShouldMatch] <= v16)
  {
    uint64_t v19 = self->query_;
    if (v19)
    {
      unsigned int maxCoord = self->maxCoord_;
      char disableCoord = self->disableCoord_;
      int v22 = JavaLangMath_maxWithInt_withInt_(1, [(OrgApacheLuceneSearchBooleanQuery *)v19 getMinimumNumberShouldMatch]);
      return new_OrgApacheLuceneSearchBooleanScorer_initWithOrgApacheLuceneSearchBooleanWeight_withBoolean_withInt_withJavaUtilCollection_withInt_withBoolean_(self, disableCoord, maxCoord, v8, v22, self->needsScores_);
    }
    goto LABEL_20;
  }
  return 0;
}

- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  id v5 = -[OrgApacheLuceneSearchBooleanWeight BOOLeanScorerWithOrgApacheLuceneIndexLeafReaderContext:](self, "BOOLeanScorerWithOrgApacheLuceneIndexLeafReaderContext:");
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  query = self->query_;
  if (!query) {
    goto LABEL_11;
  }
  if ([(OrgApacheLuceneSearchBooleanQuery *)query getMinimumNumberShouldMatch] < 2)
  {
    uint64_t v8 = -1;
    goto LABEL_8;
  }
  if (!a3 || (id v9 = [a3 reader]) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v8 = (int)[v9 maxDoc] / 3;
LABEL_8:
  if ((uint64_t)[v6 cost] <= v8)
  {
LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)OrgApacheLuceneSearchBooleanWeight;
    return [(OrgApacheLuceneSearchWeight *)&v11 bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  }
  return v6;
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  query = self->query_;
  if (!query) {
    goto LABEL_39;
  }
  unsigned int v6 = [(OrgApacheLuceneSearchBooleanQuery *)query getMinimumNumberShouldMatch];
  unsigned int v7 = new_JavaUtilArrayList_init();
  uint64_t v8 = new_JavaUtilArrayList_init();
  id v49 = new_JavaUtilArrayList_init();
  id v9 = new_JavaUtilArrayList_init();
  id v10 = [(OrgApacheLuceneSearchBooleanQuery *)self->query_ iterator];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_39:
  }
    JreThrowNullPointerException();
  uint64_t v12 = v10;
  uint64_t v50 = v7;
  unsigned int v47 = v6;
  signed int v48 = self;
  id v13 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(weights);
        }
        if (!v12) {
          goto LABEL_39;
        }
        uint64_t v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v18 = [v12 next];
        if (!v17) {
          goto LABEL_39;
        }
        uint64_t v19 = v18;
        id v20 = [v17 scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
        if (v20)
        {
          if (!v19) {
            goto LABEL_39;
          }
          id v21 = v20;
          if (![v19 isRequired])
          {
            if ([v19 isProhibited]) {
              long long v23 = v49;
            }
            else {
              long long v23 = v9;
            }
LABEL_21:
            [(JavaUtilArrayList *)v23 addWithId:v21];
            continue;
          }
          [(JavaUtilArrayList *)v50 addWithId:v21];
          unsigned __int8 v22 = [v19 isScoring];
          long long v23 = v8;
          if (v22) {
            goto LABEL_21;
          }
        }
        else
        {
          if (!v19) {
            goto LABEL_39;
          }
          if ([v19 isRequired]) {
            return 0;
          }
        }
      }
      id v14 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v14);
  }
  int v24 = v47;
  long long v25 = v8;
  if ([(JavaUtilArrayList *)v9 size] == v47)
  {
    [(JavaUtilArrayList *)v50 addAllWithJavaUtilCollection:v9];
    [(JavaUtilArrayList *)v8 addAllWithJavaUtilCollection:v9];
    [(JavaUtilArrayList *)v9 clear];
    int v24 = 0;
  }
  if ([(JavaUtilArrayList *)v50 isEmpty] && [(JavaUtilArrayList *)v9 isEmpty]
    || [(JavaUtilArrayList *)v9 size] < v24)
  {
    return 0;
  }
  if (!v48->needsScores_ && !v24 && [(JavaUtilArrayList *)v50 size] >= 1) {
    [(JavaUtilArrayList *)v9 clear];
  }
  if ([(JavaUtilArrayList *)v9 isEmpty])
  {
    v27 = sub_1000E1040((uint64_t)v48, v50, v8, v48->disableCoord_);
    return sub_1000E0F68(v48, (void **)&v27->super.super.super.super.isa, v49);
  }
  if ([(JavaUtilArrayList *)v50 isEmpty])
  {
    v27 = (OrgApacheLuceneSearchBooleanWeight_$1 *)sub_1000E1174((uint64_t)v48, v9, v24, v48->disableCoord_);
    return sub_1000E0F68(v48, (void **)&v27->super.super.super.super.isa, v49);
  }
  id v28 = sub_1000E1040((uint64_t)v48, v50, v8, 1);
  v29 = sub_1000E0F68(v48, (void **)&v28->super.super.super.super.isa, v49);
  float v30 = sub_1000E1174((uint64_t)v48, v9, v24, 1);
  id v31 = v30;
  if (v48->disableCoord_)
  {
    if (v24 < 1)
    {
      uint64_t v43 = new_OrgApacheLuceneSearchReqOptSumScorer_initWithOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchScorer_((void **)&v29->super.super.super.isa, v30);
      return v43;
    }
    v58[0] = v29;
    v58[1] = v30;
    uint64_t v32 = +[IOSObjectArray arrayWithObjects:v58 count:2 type:OrgApacheLuceneSearchScorer_class_()];
    uint64_t v33 = JavaUtilArrays_asListWithNSObjectArray_(v32);
    v57[0] = v29;
    v57[1] = v31;
    uint64_t v34 = +[IOSObjectArray arrayWithObjects:v57 count:2 type:OrgApacheLuceneSearchScorer_class_()];
    uint64_t v35 = JavaUtilArrays_asListWithNSObjectArray_(v34);
    float v36 = 1.0;
    uint64_t v37 = v48;
    uint64_t v38 = v33;
  }
  else
  {
    if ([(JavaUtilArrayList *)v9 size] != 1)
    {
      if (v24 < 1) {
        uint64_t v43 = new_OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer_initWithOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchScorer_withInt_withFloatArray_((void **)&v29->super.super.super.isa, v31, [(JavaUtilArrayList *)v25 size], v48->coords_);
      }
      else {
        uint64_t v43 = new_OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer_initWithOrgApacheLuceneSearchWeight_withFloatArray_withOrgApacheLuceneSearchScorer_withInt_withOrgApacheLuceneSearchScorer_(v48, v48->coords_, v29, [(JavaUtilArrayList *)v25 size], v31);
      }
      return v43;
    }
    if (v24 < 1)
    {
      [(OrgApacheLuceneSearchBooleanWeight *)v48 coordWithInt:[(JavaUtilArrayList *)v25 size] withInt:v48->maxCoord_];
      float v45 = v44;
      [(OrgApacheLuceneSearchBooleanWeight *)v48 coordWithInt:[(JavaUtilArrayList *)v25 size] + 1 withInt:v48->maxCoord_];
      uint64_t v43 = new_OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer_initWithOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchScorer_withFloat_withFloat_((void **)&v29->super.super.super.isa, v31, v45, v46);
      return v43;
    }
    v56[0] = v29;
    v56[1] = v31;
    CFStringRef v39 = +[IOSObjectArray arrayWithObjects:v56 count:2 type:OrgApacheLuceneSearchScorer_class_()];
    v40 = JavaUtilArrays_asListWithNSObjectArray_(v39);
    v55[0] = v29;
    v55[1] = v31;
    uint64_t v41 = +[IOSObjectArray arrayWithObjects:v55 count:2 type:OrgApacheLuceneSearchScorer_class_()];
    uint64_t v42 = JavaUtilArrays_asListWithNSObjectArray_(v41);
    [(OrgApacheLuceneSearchBooleanWeight *)v48 coordWithInt:[(JavaUtilArrayList *)v25 size] + 1 withInt:v48->maxCoord_];
    uint64_t v37 = v48;
    uint64_t v38 = v40;
    uint64_t v35 = v42;
  }
  uint64_t v43 = new_OrgApacheLuceneSearchConjunctionScorer_initWithOrgApacheLuceneSearchWeight_withJavaUtilList_withJavaUtilList_withFloat_(v37, v38, v35, v36);
  return v43;
}

- (id)reqWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4 withBoolean:(BOOL)a5
{
  return sub_1000E1040((uint64_t)self, a3, a4, a5);
}

- (id)exclWithOrgApacheLuceneSearchScorer:(id)a3 withJavaUtilList:(id)a4
{
  return sub_1000E0F68(self, (void **)a3, a4);
}

- (id)optWithJavaUtilList:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_1000E1174((uint64_t)self, a3, a4, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end