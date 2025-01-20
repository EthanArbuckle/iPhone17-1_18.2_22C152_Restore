@interface ComAppleProactiveLuceneJContextJapaneseAnalyzer
- (ComAppleProactiveLuceneJContextJapaneseAnalyzer)init;
- (id)createComponentsWithNSString:(id)a3;
@end

@implementation ComAppleProactiveLuceneJContextJapaneseAnalyzer

- (id)createComponentsWithNSString:(id)a3
{
  v3 = [ComAppleProactiveLuceneJContextJapaneseAnalyzer_CRFJapaneseTokenizer alloc];
  ComAppleProactiveLuceneCRFTokenizer_init((uint64_t)v3);
  JreStrongAssign((id *)&v3->super.localeIdentifier_, @"ja");
  v4 = new_OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents_initWithOrgApacheLuceneAnalysisTokenizer_(v3);
  return v4;
}

- (ComAppleProactiveLuceneJContextJapaneseAnalyzer)init
{
  return self;
}

@end