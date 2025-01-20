@interface OrgApacheLuceneDocumentField_Index_$5Enum
- (BOOL)isAnalyzed;
- (BOOL)isIndexed;
- (BOOL)omitNorms;
- (OrgApacheLuceneDocumentField_Index_$5Enum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_Index_$5Enum

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
  return 1;
}

- (OrgApacheLuceneDocumentField_Index_$5Enum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

@end