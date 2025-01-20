@interface OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight
- (OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight)initWithOrgApacheLuceneSearchDisjunctionMaxQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5;
- (float)getValueForNormalization;
- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4;
- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
- (void)extractTermsWithJavaUtilSet:(id)a3;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight

- (OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight)initWithOrgApacheLuceneSearchDisjunctionMaxQuery:(id)a3 withOrgApacheLuceneSearchIndexSearcher:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (void)extractTermsWithJavaUtilSet:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_11:
  }
    JreThrowNullPointerException();
  unint64_t v5 = [(JavaUtilArrayList *)self->weights_ countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = (id)v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(weights);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_11;
        }
        objc_msgSend(v9, "extractTermsWithJavaUtilSet:", a3, (void)v10);
      }
      id v6 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (float)getValueForNormalization
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_13:
  }
    JreThrowNullPointerException();
  unint64_t v4 = [(JavaUtilArrayList *)self->weights_ countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = (id)v4;
    uint64_t v6 = *(void *)v16;
    float v7 = 0.0;
    float v8 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(weights);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_13;
        }
        objc_msgSend(v10, "getValueForNormalization", (void)v15);
        float v7 = v7 + v11;
        JavaLangMath_maxWithFloat_withFloat_(v8, v11);
        float v8 = v12;
      }
      id v5 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
    float v8 = 0.0;
  }
  [(OrgApacheLuceneSearchQuery *)self->this$0_ getBoost];
  return v13
       * (float)(v13
               * (float)(v8
                       + (float)((float)((float)(v7 - v8) * *((float *)&self->this$0_->disjuncts_ + 1))
                               * *((float *)&self->this$0_->disjuncts_ + 1))));
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  [(OrgApacheLuceneSearchQuery *)self->this$0_ getBoost];
  float v8 = v7;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v10 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v13 = v10;
    float v14 = v8 * a4;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(weights);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!v17) {
          goto LABEL_11;
        }
        *(float *)&double v11 = a3;
        *(float *)&double v12 = v14;
        objc_msgSend(v17, "normalizeWithFloat:withFloat:", v11, v12, (void)v18);
      }
      id v13 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (id)scorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  id v5 = new_JavaUtilArrayList_init();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_16:
  }
    JreThrowNullPointerException();
  float v7 = v5;
  unint64_t v8 = [(JavaUtilArrayList *)self->weights_ countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = (id)v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(weights);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_16;
        }
        id v13 = objc_msgSend(v12, "scorerWithOrgApacheLuceneIndexLeafReaderContext:", a3, (void)v15);
        if (v13) {
          [(JavaUtilArrayList *)v7 addWithId:v13];
        }
      }
      id v9 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  if ([(JavaUtilArrayList *)v7 isEmpty]) {
    return 0;
  }
  if ([(JavaUtilArrayList *)v7 size] == 1) {
    return [(JavaUtilArrayList *)v7 getWithInt:0];
  }
  return new_OrgApacheLuceneSearchDisjunctionMaxScorer_initWithOrgApacheLuceneSearchWeight_withFloat_withJavaUtilList_withBoolean_(self, v7, self->needsScores_, *((float *)&self->this$0_->disjuncts_ + 1));
}

- (id)explainWithOrgApacheLuceneIndexLeafReaderContext:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  float v7 = new_JavaUtilArrayList_init();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  weights = self->weights_;
  if (!weights) {
LABEL_17:
  }
    JreThrowNullPointerException();
  id v9 = v7;
  unint64_t v10 = [(JavaUtilArrayList *)self->weights_ countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v10) {
    goto LABEL_16;
  }
  id v11 = (id)v10;
  char v12 = 0;
  uint64_t v13 = *(void *)v36;
  float v14 = 0.0;
  float v15 = 0.0;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(weights);
      }
      long long v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if (!v17) {
        goto LABEL_17;
      }
      id v18 = [v17 explainWithOrgApacheLuceneIndexLeafReaderContext:a3 withInt:v4];
      if (!v18) {
        goto LABEL_17;
      }
      long long v19 = v18;
      if ([v18 isMatch])
      {
        [(JavaUtilArrayList *)v9 addWithId:v19];
        [v19 getValue];
        float v14 = v14 + v20;
        [v19 getValue];
        JavaLangMath_maxWithFloat_withFloat_(v15, v21);
        float v15 = v22;
        char v12 = 1;
      }
    }
    id v11 = [(JavaUtilArrayList *)weights countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v11);
  if (v12)
  {
    float v30 = *((float *)&self->this$0_->disjuncts_ + 1);
    float v31 = v15 + (float)((float)(v14 - v15) * v30);
    if (v30 == 0.0) {
      CFStringRef v32 = @"max of:";
    }
    else {
      CFStringRef v32 = JreStrcat("$F$", v23, v24, v25, v26, v27, v28, v29, @"max plus ");
    }
    return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withJavaUtilCollection_((uint64_t)v32, v9, v31);
  }
  else
  {
LABEL_16:
    v33 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
    return OrgApacheLuceneSearchExplanation_noMatchWithNSString_withOrgApacheLuceneSearchExplanationArray_(@"No matching clause", v33);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionMaxQuery_DisjunctionMaxWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end