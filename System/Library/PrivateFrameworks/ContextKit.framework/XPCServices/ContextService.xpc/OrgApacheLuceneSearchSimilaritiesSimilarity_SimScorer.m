@interface OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer
- (id)explainWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4;
@end

@implementation OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer

- (id)explainWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a3;
  [a4 getValue];
  -[OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer scoreWithInt:withFloat:](self, "scoreWithInt:withFloat:", v5);
  float v8 = v7;
  [a4 getValue];
  CFStringRef v16 = JreStrcat("$I$F$", v9, v10, v11, v12, v13, v14, v15, @"score(doc=");
  v17 = JavaUtilCollections_singletonWithId_(a4);
  return OrgApacheLuceneSearchExplanation_matchWithFloat_withNSString_withJavaUtilCollection_((uint64_t)v16, v17, v8);
}

@end