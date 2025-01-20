@interface OrgApacheLuceneDocumentField_Index_$2Enum
- (BOOL)isAnalyzed;
- (BOOL)isIndexed;
- (BOOL)omitNorms;
- (OrgApacheLuceneDocumentField_Index_$2Enum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_Index_$2Enum

- (BOOL)isIndexed
{
  return 1;
}

- (BOOL)isAnalyzed
{
  return 1;
}

- (BOOL)omitNorms
{
  return 0;
}

- (OrgApacheLuceneDocumentField_Index_$2Enum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

@end