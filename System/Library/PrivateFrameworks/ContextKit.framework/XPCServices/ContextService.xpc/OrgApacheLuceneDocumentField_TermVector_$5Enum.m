@interface OrgApacheLuceneDocumentField_TermVector_$5Enum
- (BOOL)isStored;
- (BOOL)withOffsets;
- (BOOL)withPositions;
- (OrgApacheLuceneDocumentField_TermVector_$5Enum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_TermVector_$5Enum

- (BOOL)isStored
{
  return 1;
}

- (BOOL)withPositions
{
  return 1;
}

- (BOOL)withOffsets
{
  return 1;
}

- (OrgApacheLuceneDocumentField_TermVector_$5Enum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

@end