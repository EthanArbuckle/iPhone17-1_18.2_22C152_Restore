@interface OrgApacheLuceneDocumentField_TermVector_$2Enum
- (BOOL)isStored;
- (BOOL)withOffsets;
- (BOOL)withPositions;
- (OrgApacheLuceneDocumentField_TermVector_$2Enum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_TermVector_$2Enum

- (BOOL)isStored
{
  return 1;
}

- (BOOL)withPositions
{
  return 0;
}

- (BOOL)withOffsets
{
  return 0;
}

- (OrgApacheLuceneDocumentField_TermVector_$2Enum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

@end