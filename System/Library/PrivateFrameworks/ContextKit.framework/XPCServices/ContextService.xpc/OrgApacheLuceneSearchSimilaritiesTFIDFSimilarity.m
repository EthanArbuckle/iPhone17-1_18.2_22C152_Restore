@interface OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity
- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity)init;
- (id)computeWeightWithFloat:(float)a3 withOrgApacheLuceneSearchCollectionStatistics:(id)a4 withOrgApacheLuceneSearchTermStatisticsArray:(id)a5;
- (id)explainFieldWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a5 withOrgApacheLuceneIndexNumericDocValues:(id)a6;
- (id)explainQueryWithOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a3;
- (id)explainScoreWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a5 withOrgApacheLuceneIndexNumericDocValues:(id)a6;
- (id)idfExplainWithOrgApacheLuceneSearchCollectionStatistics:(id)a3 withOrgApacheLuceneSearchTermStatistics:(id)a4;
- (id)idfExplainWithOrgApacheLuceneSearchCollectionStatistics:(id)a3 withOrgApacheLuceneSearchTermStatisticsArray:(id)a4;
- (id)simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4;
- (int64_t)computeNormWithOrgApacheLuceneIndexFieldInvertState:(id)a3;
@end

@implementation OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity

- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity)init
{
  return self;
}

- (id)idfExplainWithOrgApacheLuceneSearchCollectionStatistics:(id)a3 withOrgApacheLuceneSearchTermStatistics:(id)a4
{
  if (!a4 || (id v6 = [a4 docFreq], !a3)) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity idfWithLong:withLong:](self, "idfWithLong:withLong:", v6, [a3 maxDoc]);
  float v8 = v7;
  CFStringRef v16 = JreStrcat("$J$JC", v9, v10, v11, v12, v13, v14, v15, @"idf(docFreq=");
  v17 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v16, v17, v8);
}

- (id)idfExplainWithOrgApacheLuceneSearchCollectionStatistics:(id)a3 withOrgApacheLuceneSearchTermStatisticsArray:(id)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  id v6 = [a3 maxDoc];
  float v7 = new_JavaUtilArrayList_init();
  if (!a4) {
    goto LABEL_9;
  }
  float v8 = v7;
  uint64_t v9 = (void **)((char *)a4 + 24);
  uint64_t v10 = (void **)((char *)a4 + 8 * *((int *)a4 + 2) + 24);
  float v11 = 0.0;
  if ((char *)a4 + 24 < (char *)v10)
  {
    while (1)
    {
      uint64_t v12 = *v9;
      if (!*v9) {
        break;
      }
      ++v9;
      -[OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity idfWithLong:withLong:](self, "idfWithLong:withLong:", [v12 docFreq], v6);
      float v14 = v13;
      CFStringRef v22 = JreStrcat("$J$JC", v15, v16, v17, v18, v19, v20, v21, @"idf(docFreq=");
      v23 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchExplanation_class_()];
      [(JavaUtilArrayList *)v8 addWithId:OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withOrgApacheLuceneSearchExplanationArray_((uint64_t)v22, v23, v14)];
      float v11 = v11 + v14;
      if (v9 >= v10) {
        goto LABEL_6;
      }
    }
LABEL_9:
    JreThrowNullPointerException();
  }
LABEL_6:
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withJavaUtilCollection_(@"idf(), sum of:", v8, v11);
}

- (int64_t)computeNormWithOrgApacheLuceneIndexFieldInvertState:(id)a3
{
  [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity *)self lengthNormWithOrgApacheLuceneIndexFieldInvertState:a3];
  return (int64_t)-[OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity encodeNormValueWithFloat:](self, "encodeNormValueWithFloat:");
}

- (id)computeWeightWithFloat:(float)a3 withOrgApacheLuceneSearchCollectionStatistics:(id)a4 withOrgApacheLuceneSearchTermStatisticsArray:(id)a5
{
  if (!a5
    || (*((_DWORD *)a5 + 2) != 1
      ? (id v7 = -[OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity idfExplainWithOrgApacheLuceneSearchCollectionStatistics:withOrgApacheLuceneSearchTermStatisticsArray:](self, "idfExplainWithOrgApacheLuceneSearchCollectionStatistics:withOrgApacheLuceneSearchTermStatisticsArray:", a4)): (id v7 = [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity *)self idfExplainWithOrgApacheLuceneSearchCollectionStatistics:a4 withOrgApacheLuceneSearchTermStatistics:*((void *)a5 + 3)]), v8 = v7, !a4))
  {
    JreThrowNullPointerException();
  }
  id v9 = [a4 field];
  uint64_t v10 = [OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats alloc];
  sub_10004C6EC((uint64_t)v10, v9, v8, a3);
  return v10;
}

- (id)simScorerWithOrgApacheLuceneSearchSimilaritiesSimilarity_SimWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4
{
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (!a4 || (id v7 = [a4 reader]) == 0 || !a3) {
    JreThrowNullPointerException();
  }
  id v8 = [v7 getNormValuesWithNSString:*((void *)a3 + 1)];
  id v9 = [OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer alloc];
  sub_10004C4D0((uint64_t)v9, self, a3, v8);
  return v9;
}

- (id)explainQueryWithOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a3
{
  return sub_10004BF94((uint64_t)a3);
}

- (id)explainFieldWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a5 withOrgApacheLuceneIndexNumericDocValues:(id)a6
{
  return sub_10004C100(self, *(uint64_t *)&a3, a4, (uint64_t)a5, a6);
}

- (id)explainScoreWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a5 withOrgApacheLuceneIndexNumericDocValues:(id)a6
{
  return sub_10004C33C(self, *(uint64_t *)&a3, a4, (uint64_t)a5, a6);
}

@end