@interface OrgApacheLuceneAnalysisCoreLowerCaseTokenizer
- (OrgApacheLuceneAnalysisCoreLowerCaseTokenizer)init;
- (OrgApacheLuceneAnalysisCoreLowerCaseTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3;
- (int)normalizeWithInt:(int)a3;
@end

@implementation OrgApacheLuceneAnalysisCoreLowerCaseTokenizer

- (OrgApacheLuceneAnalysisCoreLowerCaseTokenizer)init
{
  return self;
}

- (OrgApacheLuceneAnalysisCoreLowerCaseTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3
{
  return self;
}

- (int)normalizeWithInt:(int)a3
{
  return JavaLangCharacter_toLowerCaseWithInt_(a3);
}

@end