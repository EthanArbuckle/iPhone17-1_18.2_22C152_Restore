@interface OrgApacheLuceneAnalysisCoreSimpleAnalyzer
- (OrgApacheLuceneAnalysisCoreSimpleAnalyzer)init;
- (id)createComponentsWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisCoreSimpleAnalyzer

- (OrgApacheLuceneAnalysisCoreSimpleAnalyzer)init
{
  return self;
}

- (id)createComponentsWithNSString:(id)a3
{
  v3 = new_OrgApacheLuceneAnalysisCoreLowerCaseTokenizer_init();
  v4 = new_OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents_initWithOrgApacheLuceneAnalysisTokenizer_(v3);
  return v4;
}

@end