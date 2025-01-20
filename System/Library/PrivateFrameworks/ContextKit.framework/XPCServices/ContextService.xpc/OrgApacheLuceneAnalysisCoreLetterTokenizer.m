@interface OrgApacheLuceneAnalysisCoreLetterTokenizer
- (BOOL)isTokenCharWithInt:(int)a3;
- (OrgApacheLuceneAnalysisCoreLetterTokenizer)init;
- (OrgApacheLuceneAnalysisCoreLetterTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisCoreLetterTokenizer

- (OrgApacheLuceneAnalysisCoreLetterTokenizer)init
{
  return self;
}

- (OrgApacheLuceneAnalysisCoreLetterTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3
{
  return self;
}

- (BOOL)isTokenCharWithInt:(int)a3
{
  return JavaLangCharacter_isLetterWithInt_(a3);
}

@end